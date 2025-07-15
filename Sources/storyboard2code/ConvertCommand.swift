//
//  ConvertCommand.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import ArgumentParser
import StoryboardConverter
import Foundation
import XMLParsing
import StoryboardModel

struct ConvertCommand: AsyncParsableCommand {
	static let configuration = CommandConfiguration(
		commandName: "convert")

	@Option(name: .shortAndLong, help: "How the generated code should be declared.")
	var codegen: CodegenOption?
	
	@Option(name: .shortAndLong, help: "The name of the output file.")
	var output: String?
	
	@Option(name: .long, help: "Overwrite the output file if it already exists.")
	var overwrite = false

	@Argument(help: "The storyboards to convert.")
	var input: [String]

	func run() async throws {
		if input.isEmpty {
			throw ValidationError("Nothing to convert")
		}
		
		let cd = URL.currentDirectory()
		let defaultOutput = output
			.map { URL(fileURLWithPath: $0, relativeTo: cd) }?
			.deletingPathExtension()
			.appendingPathExtension("swift")
		
		try await withThrowingTaskGroup(of: Void.self) { group in
			for filepath in input {
				let inputURL = URL(fileURLWithPath: filepath, relativeTo: cd)
				let (outputURL, hint) = output(for: inputURL, default: defaultOutput)
				
				guard overwrite || !FileManager.default.fileExists(atPath: outputURL.path) else {
					print("Skipping \(inputURL.relativePath)")
					continue
				}
				
				let codegen = codegen?.argument ?? hint ?? .class
				group.addTask { try await convert(inputURL, to: outputURL, codegen: codegen) }
			}
			
			for try await _ in group {}
		}
	}
	
	private func convert(_ input: URL, to output: URL, codegen: CodeGenType) async throws {
		// step("convert_storyboard_to_model")
		let xml = try String(contentsOf: input)
		
		guard let data = xml.data(using: .utf8) else {
			throw ValidationError("Expected storyboard file content to be UTF-8 encoded.")
		}
		
		let document = try XMLDecoder().decode(Document.self, from: data)
		
		// step("generate_swift_code")
		let code = SwiftCodeGenerator(document: document, codegen: codegen).generate()

		// step("write_code_to_file")

		try code.write(to: output, atomically: true, encoding: .utf8)

		// info("Successfully write to file.")
		print(output.relativePath)
	}
	
	private func output(for input: URL, default defaultOutput: URL?) -> (URL, hint: CodeGenType?) {
		var parent = input.deletingLastPathComponent()
		if ["lproj"].contains(parent.pathExtension) {
			parent = parent.deletingLastPathComponent()
		}
		
		let lastPathComponent = input.deletingPathExtension().lastPathComponent
		let trunk = input.deletingLastPathComponent()
		let hint: CodeGenType = FileManager.default.fileExists(atPath: parent.appending(component: lastPathComponent + ".swift").path) ? .extension : .class
		
		if let output = self.input.count == 1 ? defaultOutput : nil {
			return (output, hint)
		}
		
		let output = parent.appending(component: lastPathComponent + "+UI.swift")
		return (output, hint)
	}
	
}

public enum CodegenOption: String, ExpressibleByArgument {
	case `class`
	case `extension`
	
	var argument: CodeGenType {
		switch self {
		case .class: .class
		case .extension: .extension
		}
	}
}

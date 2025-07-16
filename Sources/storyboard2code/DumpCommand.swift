//
//  DumpCommand.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import Foundation
import ArgumentParser
import SwiftXML
import StoryboardModel

struct DumpCommand: AsyncParsableCommand {
	static let configuration = CommandConfiguration(
		commandName: "dump")
	
	@Argument(help: "The storyboards to convert.")
	var input: String
	
	func run() async throws {
		let cd = URL.currentDirectory()
		let url = URL(fileURLWithPath: input, relativeTo: cd)
		
		let data = try Data(contentsOf: url)
		let decoder = XMLDecoder()
		let storyboard = try decoder.decode(IBDocument.self, at: "document", from: data)
		
		dump(storyboard)
	}
}

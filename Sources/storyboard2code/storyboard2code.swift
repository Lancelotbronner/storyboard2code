//
//  ConvertCommand.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import ArgumentParser

@main struct storyboard2code: AsyncParsableCommand {
	static let configuration = CommandConfiguration(
		commandName: "storyboard2code",
		subcommands: [
			ConvertCommand.self,
		])
}

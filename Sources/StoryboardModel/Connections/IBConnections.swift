//
//  IBConnections.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-16.
//

import SwiftXML

public struct IBOutlet: Codable {
	@XMLAttribute public var property: String
	@XMLAttribute public var destination: String
	@XMLAttribute public var id: String
}

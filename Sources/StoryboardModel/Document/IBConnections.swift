//
//  IBConnections.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-16.
//

import SwiftXML

public enum IBConnection: Codable, XMLChoice {
	case outlet(IBOutlet)
	case outletCollection(IBOutletCollection)
	case action(IBAction)
	case segue(IBSegue)
}

public struct IBOutlet: Codable {
	@XMLAttribute public var id: String
	@XMLAttribute public var property: String
	@XMLAttribute public var destination: String
}

public struct IBOutletCollection: Codable {
	@XMLAttribute public var id: String
	@XMLAttribute public var property: String
	@XMLAttribute public var destination: String
	@XMLAttribute public var collectionClass: String
}

public struct IBAction: Codable {
	@XMLAttribute public var id: String
	@XMLAttribute public var selector: String
	@XMLAttribute public var eventType: String
	@XMLAttribute public var destination: String
}

public struct IBSegue: Codable {
	@XMLAttribute public var id: String
	@XMLAttribute public var kind: String
	@XMLAttribute public var destination: String
	@XMLAttribute public var relationship: String
}

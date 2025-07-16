//
//  Document.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import SwiftXML

public struct IBDocument: Codable {
	@XMLAttribute var type: String
	@XMLAttribute var version: String
	@XMLAttribute var toolsVersion: Int
	@XMLAttribute var targetRuntime: String
	@XMLAttribute var propertyAccessControl: String
	@XMLAttribute var useAutolayout: Bool
	@XMLAttribute var useTraitCollections: Bool
	@XMLAttribute var useSafeAreas: Bool
	@XMLAttribute var colorMatched: Bool
	
	public var dependencies = IBDependencies()
	public var customFonts = IBCustomFont(key: "customFonts")
	public var objects: [IBObject]
	public var scenes: [IBScene]?
//	public var resources: [IBImage]
}

public struct IBCustomFont: Codable, CustomStringConvertible, CustomReflectable {
	@XMLAttribute public var key: String
	@XMLChildren public var fonts: [IBFont]
	
	public var customMirror: Mirror {
		Mirror("\(Self.self)", unlabeledChildren: fonts)
	}
	
	public var description: String {
		let c = fonts.count
		return c == 1 ? "1 font" : "\(c) fonts"
	}
	
	private enum CodingKeys: String, CodingKey {
		case key
		case fonts = "array"
	}
}

public struct IBObjectCollection: Codable {
	var values: [IBObject] = []
	
	public init(from decoder: any Decoder) throws {
		var container = try decoder.unkeyedContainer()
		while !container.isAtEnd {
			values.append(try container.decode(IBObject.self))
		}
	}
	
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(values)
	}
}

//
//  Document.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import XMLCoder

public struct IBDocument: Codable {
	@Attribute var type: String?
	@Attribute var version: String?
	@Attribute var toolsVersion: Int?
	@Attribute var targetRuntime: String
	@Attribute var propertyAccessControl: String?
	@Attribute var useAutoLayout: Bool?
	@Attribute var useTraitCollections: Bool?
	@Attribute var useSafeAreas: Bool?
	@Attribute var colorMatched: Bool?
	
	public var dependencies: IBDependencies?
	public var customFonts: IBCustomFont?
	public var objects: IBObjectCollection
	public var scenes: [IBScene]
    public var resources: [IBImage]
    
    private enum CodingKeys: String, CodingKey {
		case type
		case version
		case toolsVersion
		case targetRuntime
		case propertyAccessControl
		case useAutoLayout
		case useTraitCollections
		case useSafeAreas
		case colorMatched
		
		case dependencies
		case customFonts
		case objects
        case scenes = "scene"
        case resources = "resource"
    }
}

public struct IBCustomFont: Codable {
	@Attribute public var key: String
	public var fonts: [IBFont]
	
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

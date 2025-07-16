//
//  IBObject.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import SwiftXML

public enum IBObject: Codable, XMLChoice {
	case placeholder(IBPlaceholder)
	case view(IBView)
	case stackView(IBView, IBStackView)
}

public struct IBPlaceholder: Codable {
	@XMLAttribute public var placeholderIdentifier: String
	@XMLAttribute public var id: Int
	@XMLAttribute public var userLabel: String?
	@XMLAttribute public var customClass: String
	@XMLAttribute public var customModule: String?
	@XMLAttribute public var customModuleProvider: String?
}

public struct IBProperty<Value: Codable>: Codable {
	@XMLAttribute public var key: String
	public var value: Value
	
	public init(from decoder: any Decoder) throws {
		var container = try decoder.container(keyedBy: CodingKeys.self)
		_key = try container.decode(XMLAttribute<String>.self, forKey: .key)
		value = try Value(from: decoder)
	}
}

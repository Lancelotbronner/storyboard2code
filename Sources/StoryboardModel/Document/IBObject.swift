//
//  IBObject.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import XMLCoder

public enum IBObject: Codable {
	case placeholder(IBPlaceholder)
	case view(IBView)
	
	private enum CodingKeys: CodingKey, XMLChoiceCodingKey {
		case placeholder
		case view
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		print(container.allKeys)
		do {
			self = .placeholder(try container.decode(IBPlaceholder.self, forKey: .placeholder))
		} catch {
			self = .view(try container.decode(IBView.self, forKey: .view))
		}
	}
}

public struct IBPlaceholder: Codable {
	@Attribute public var placeholderIdentifier: String
	@Attribute public var id: Int
	@Attribute public var userLabel: String
	@Attribute public var customClass: String
	@Attribute public var customModule: String
	@Attribute public var customModuleProvider: String
}

public struct IBView: Codable {}

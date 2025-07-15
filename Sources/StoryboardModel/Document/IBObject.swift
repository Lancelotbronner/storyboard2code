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
}

public struct IBPlaceholder: Codable {}
public struct IBView: Codable {}

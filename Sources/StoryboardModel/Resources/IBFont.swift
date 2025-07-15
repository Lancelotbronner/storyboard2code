//
//  IBFont.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import XMLCoder

public struct IBFont: Codable {
	@Attribute public var key: String
	@Element public var families: [String]
	
	private enum CodingKeys: String, CodingKey {
		case key
		case families = "string"
	}
}

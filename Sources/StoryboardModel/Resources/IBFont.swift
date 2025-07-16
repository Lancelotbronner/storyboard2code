//
//  IBFont.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import SwiftXML

public struct IBFont: Codable, CustomStringConvertible, CustomReflectable {
	@XMLAttribute public var key: String
	@XMLChildren public var families: [String]
	
	public var customMirror: Mirror {
		Mirror("\(Self.self)", unlabeledChildren: families)
	}
	
	public var description: String {
		let c = families.count
		return c == 1 ? "1 family" : "\(c) families"
	}
	
	private enum CodingKeys: String, CodingKey {
		case key
		case families = "string"
	}
}

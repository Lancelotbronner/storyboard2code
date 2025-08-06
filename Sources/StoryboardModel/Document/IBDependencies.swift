//
//  IBDependency.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import SwiftXML

public struct IBDependencies: Codable, CustomReflectable, CustomStringConvertible {
	@XMLElement var deployments: [IBDeployment] = []
	@XMLElement var plugins: [IBPlugin] = []
	
	private enum CodingKeys: String, CodingKey {
		case deployments = "deployment"
		case plugins = "plugIn"
	}
	
	public var customMirror: Mirror {
		Mirror("\(Self.self)", unlabeledChildren: deployments.map(\.description) + plugins.map(\.description))
	}
	
	public var description: String {
		let c = deployments.count + plugins.count
		return c == 1 ? "1 dependency" : "\(c) dependencies"
	}
}

public struct IBDeployment: Codable, CustomStringConvertible {
	@XMLAttribute var identifier: String
	
	public var description: String {
		"deployment \(identifier)"
	}
}

public struct IBPlugin: Codable, CustomStringConvertible {
	@XMLAttribute var identifier: String
	@XMLAttribute var version: Int
	
	public var description: String {
		"\(identifier) v\(version)"
	}
}

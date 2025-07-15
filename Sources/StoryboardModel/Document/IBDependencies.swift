//
//  IBDependency.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-15.
//

import XMLCoder

public struct IBDependencies: Codable {
	var deployments: [IBDeployment]
	var plugins: [IBPlugin]
	
	private enum CodingKeys: String, CodingKey {
		case deployments = "deployment"
		case plugins = "plugIn"
	}
}

public struct IBDeployment: Codable, CustomStringConvertible {
	@Attribute var identifier: String
	
	public var description: String {
		"deployment \(identifier)"
	}
}

public struct IBPlugin: Codable, CustomStringConvertible {
	@Attribute var identifier: String
	@Attribute var version: Int
	
	public var description: String {
		"\(identifier) v\(version)"
	}
}

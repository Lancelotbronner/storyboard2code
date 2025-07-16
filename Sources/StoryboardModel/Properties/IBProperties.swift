//
//  IBProperties.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-16.
//

import SwiftXML

public struct IBPoint: Codable {
	@XMLAttribute public var x: Int
	@XMLAttribute public var y: Int
}

public struct IBRect: Codable {
	@XMLAttribute public var x: Float
	@XMLAttribute public var y: Float
	@XMLAttribute public var width: Int
	@XMLAttribute public var height: Int
}

public struct IBAutoresizingMask: Codable {
	@XMLAttribute public var flexibleMaxX: Bool
	@XMLAttribute public var flexibleMaxY: Bool
}

public struct IBColor: Codable {
	@XMLAttribute public var white: Float
	@XMLAttribute public var colorSpace: String
	@XMLAttribute public var customColorSpace: String
}

public struct IBConstraint: Codable {
	@XMLAttribute public var firstItem: String
	@XMLAttribute public var firstAttribute: String
	@XMLAttribute public var secondItem: String
	@XMLAttribute public var secondAttribute: String
	@XMLAttribute public var constant: Float
	@XMLAttribute public var id: String
}

public struct IBFreeformSimulatedSizeMetrics: Codable {}

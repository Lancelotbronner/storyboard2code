//
//  IBView.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-16.
//

import SwiftXML

public struct IBView: Codable {
	@XMLAttribute public var id: String
	@XMLAttribute public var contentMode: String
	@XMLAttribute public var insetsLayoutMarginsFromSafeArea: Bool
	@XMLAttribute public var customClass: String
	@XMLAttribute public var customModule: String
	@XMLAttribute public var customModuleProvider: String
	
	@XMLElement public var rect: [IBProperty<IBRect>]
	@XMLElement public var autoresizingMask: [IBProperty<IBAutoresizingMask>]
	@XMLElement public var color: [IBProperty<IBAutoresizingMask>]
	@XMLElement public var freeformSimulatedSizeMetrics: [IBProperty<IBFreeformSimulatedSizeMetrics>]
	
	public var constraints: [IBConstraint] = []
	public var connections: [IBOutlet] = []
	public var subviews: [IBObject] = []
}

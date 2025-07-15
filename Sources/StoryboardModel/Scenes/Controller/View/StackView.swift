//
//  StackView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class StackView: View {
    
    // MARK: - Axis
    
    public var axis: String?
    
    // MARK: - Alignment
    
    public var alignment: String?
    
    // MARK: - Distribution
    
    public var distribution: String?
    
    // MARK: - Spacing
    
    public var spacing: String?

    public var baselineRelativeArrangement: String?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case axis
        case alignment
        case distribution
        case spacing
        case baselineRelativeArrangement
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.axis = try container.decodeIfPresent(String.self, forKey: .axis)
        self.distribution = try container.decodeIfPresent(String.self, forKey: .distribution)
        self.alignment = try container.decodeIfPresent(String.self, forKey: .alignment)
        self.spacing = try container.decodeIfPresent(String.self, forKey: .spacing)
        self.baselineRelativeArrangement = try container.decodeIfPresent(String.self, forKey: .baselineRelativeArrangement)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(axis, forKey: .axis)
        try container.encodeIfPresent(distribution, forKey: .distribution)
        try container.encodeIfPresent(alignment, forKey: .alignment)
        try container.encodeIfPresent(spacing, forKey: .spacing)
        try container.encodeIfPresent(baselineRelativeArrangement, forKey: .baselineRelativeArrangement)

        try super.encode(to: encoder)
    }

}

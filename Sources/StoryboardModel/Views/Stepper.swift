//
//  Stepper.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Stepper: View {
    
    // MARK: - Value
    
    public var value: String?
    
    // MARK: - Minimum

    public var minimumValue: String?

    // MARK: - Maximum

    public var maximumValue: String?

    // MARK: - Step

    public var stepValue: String?

    // MARK: - Behavior
    
    public var autorepeat: String? // YES

    public var continuous: String? // YES

    public var wraps: String?  // NO
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case value
        case minimumValue
        case maximumValue
        case stepValue
        case autorepeat
        case continuous
        case wraps
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.minimumValue = try container.decodeIfPresent(String.self, forKey: .minimumValue)
        self.maximumValue = try container.decodeIfPresent(String.self, forKey: .maximumValue)
        self.stepValue = try container.decodeIfPresent(String.self, forKey: .stepValue)
        self.autorepeat = try container.decodeIfPresent(String.self, forKey: .autorepeat)
        self.continuous = try container.decodeIfPresent(String.self, forKey: .continuous)
        self.wraps = try container.decodeIfPresent(String.self, forKey: .wraps)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(minimumValue, forKey: .minimumValue)
        try container.encodeIfPresent(maximumValue, forKey: .maximumValue)
        try container.encodeIfPresent(stepValue, forKey: .stepValue)
        try container.encodeIfPresent(autorepeat, forKey: .autorepeat)
        try container.encodeIfPresent(continuous, forKey: .continuous)
        try container.encodeIfPresent(wraps, forKey: .wraps)

        try super.encode(to: encoder)
    }

}

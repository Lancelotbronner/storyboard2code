//
//  Slider.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Slider: View {
    
    // MARK: - Value

    public var value: String?
    
    // MARK: - Minimum

    public var minValue: String?
    
    // MARK: - Maximum

    public var maxValue: String?
    
    // MARK: - Min Image

    public var minimumValueImage: String?

    // MARK: - Max Image
    
    public var maximumValueImage: String?
    
    // MARK: - Events
    
    public var continuous: String? // YES
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case value
        case minValue
        case maxValue
        case minimumValueImage
        case maximumValueImage
        case continuous
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.minValue = try container.decodeIfPresent(String.self, forKey: .minValue)
        self.maxValue = try container.decodeIfPresent(String.self, forKey: .maxValue)
        self.minimumValueImage = try container.decodeIfPresent(String.self, forKey: .minimumValueImage)
        self.maximumValueImage = try container.decodeIfPresent(String.self, forKey: .maximumValueImage)
        self.continuous = try container.decodeIfPresent(String.self, forKey: .continuous)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(minValue, forKey: .minValue)
        try container.encodeIfPresent(maxValue, forKey: .maxValue)
        try container.encodeIfPresent(minimumValueImage, forKey: .minimumValueImage)
        try container.encodeIfPresent(maximumValueImage, forKey: .maximumValueImage)
        try container.encodeIfPresent(continuous, forKey: .continuous)

        try super.encode(to: encoder)
    }

}

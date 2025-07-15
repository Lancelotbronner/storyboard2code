//
//  TextView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TextView: ScrollView {
    
    // MARK: - Text
    
    public var string: String?

    public var attributedString: AttributedString?

    // MARK: - Font
    
    public var fontDescription: FontDescription?
    
    // MARK: - Dynamic Type
    
    public var adjustsFontForContentSizeCategory: String?
    
    // MARK: - Text Alignment

    public var textAlignment: String?
    
    // MARK: - Data Detectors
    
    public var dataDetectorType: DataDetectorType?
    
    // MARK: - Text Input Traits
    
    public var textInputTraits: TextInputTraits?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case string
        case attributedString
        case fontDescription
        case adjustsFontForContentSizeCategory
        case textAlignment
        case dataDetectorType
        case textInputTraits
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.string = try container.decodeIfPresent(String.self, forKey: .string)
        self.attributedString = try container.decodeIfPresent(AttributedString.self, forKey: .attributedString)
        self.fontDescription = try container.decodeIfPresent(FontDescription.self, forKey: .fontDescription)
        self.adjustsFontForContentSizeCategory = try container.decodeIfPresent(String.self, forKey: .adjustsFontForContentSizeCategory)
        self.textAlignment = try container.decodeIfPresent(String.self, forKey: .textAlignment)
        self.dataDetectorType = try container.decodeIfPresent(DataDetectorType.self, forKey: .dataDetectorType)
        self.textInputTraits = try container.decodeIfPresent(TextInputTraits.self, forKey: .textInputTraits)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(string, forKey: .string)
        try container.encodeIfPresent(attributedString, forKey: .attributedString)
        try container.encodeIfPresent(fontDescription, forKey: .fontDescription)
        try container.encodeIfPresent(adjustsFontForContentSizeCategory, forKey: .adjustsFontForContentSizeCategory)
        try container.encodeIfPresent(textAlignment, forKey: .textAlignment)
        try container.encodeIfPresent(dataDetectorType, forKey: .dataDetectorType)
        try container.encodeIfPresent(textInputTraits, forKey: .textInputTraits)

        try super.encode(to: encoder)
    }

}

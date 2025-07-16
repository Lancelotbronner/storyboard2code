//
//  TextField.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TextField: View {
    
    // MARK: - Text
    
    public var text: String?
    
    public var attributedString: AttributedString?
    
    // MARK: - Font

    public var fontDescription: FontDescription?
    
    // MARK: - Dynamic Type
    
    public var adjustsFontForContentSizeCategory: String?

    // MARK: - Placeholder
    
    public var placeholder: String?
    
    // MARK: - Background Image
    
    public var background: String?
    
    // MARK: - Disabled Image

    public var disabledBackground: String?
    
    // MARK: - Border Style
    
    public var borderStyle: String?
    
    // MARK: -  Cler button
    
    public var clearButtonMode: String?
    
    // MARK: - Minimum Font Size
    
    public var minimumFontSize: String?
    
    public var adjustsFontSizeToFit: String?

    // MARK: - TextInput Traits
    
    public var textInputTraits: TextInputTraits?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case text
        case attributedString
        case fontDescription
        case adjustsFontForContentSizeCategory
        case placeholder
        case background
        case disabledBackground
        case borderStyle
        case clearButtonMode
        case minimumFontSize
        case adjustsFontSizeToFit
        case textInputTraits
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.attributedString = try container.decodeIfPresent(AttributedString.self, forKey: .attributedString)
        self.fontDescription = try container.decodeIfPresent(FontDescription.self, forKey: .fontDescription)
        self.adjustsFontForContentSizeCategory = try container.decodeIfPresent(String.self, forKey: .adjustsFontForContentSizeCategory)
        self.placeholder = try container.decodeIfPresent(String.self, forKey: .placeholder)
        self.background = try container.decodeIfPresent(String.self, forKey: .background)
        self.disabledBackground = try container.decodeIfPresent(String.self, forKey: .disabledBackground)
        self.borderStyle = try container.decodeIfPresent(String.self, forKey: .borderStyle)
        self.clearButtonMode = try container.decodeIfPresent(String.self, forKey: .clearButtonMode)
        self.minimumFontSize = try container.decodeIfPresent(String.self, forKey: .minimumFontSize)
        self.adjustsFontSizeToFit = try container.decodeIfPresent(String.self, forKey: .adjustsFontSizeToFit)
        self.textInputTraits = try container.decodeIfPresent(TextInputTraits.self, forKey: .textInputTraits)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(attributedString, forKey: .attributedString)
        try container.encodeIfPresent(fontDescription, forKey: .fontDescription)
        try container.encodeIfPresent(adjustsFontForContentSizeCategory, forKey: .adjustsFontForContentSizeCategory)
        try container.encodeIfPresent(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(background, forKey: .background)
        try container.encodeIfPresent(disabledBackground, forKey: .disabledBackground)
        try container.encodeIfPresent(borderStyle, forKey: .borderStyle)
        try container.encodeIfPresent(clearButtonMode, forKey: .clearButtonMode)
        try container.encodeIfPresent(minimumFontSize, forKey: .minimumFontSize)
        try container.encodeIfPresent(adjustsFontSizeToFit, forKey: .adjustsFontSizeToFit)
        try container.encodeIfPresent(textInputTraits, forKey: .textInputTraits)
        
        try super.encode(to: encoder)
    }

}

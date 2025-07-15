//
//  Button.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Button: View {
    
    // MARK: - Type

    public var buttonType: String?
    
    // MARK: - Font
    
    public var fontDescription: FontDescription?

    // MARK: - State
    
    public var state: [State]?
    
    // MARK: - Accessibility

    public var adjustsImageSizeForAccessibilityContentSizeCategory: String?
    
    // MARK: - Shadow Offset
    
    public var reversesTitleShadowWhenHighlighted: String? // NO
    
    // MARK: - Drawing
    
    public var showsTouchWhenHighlighted: String?  // NO
    
    public var adjustsImageWhenHighlighted: String?    // YES
    
    public var adjustsImageWhenDisabled: String?   // YES
    
    // MARK: - Line Break

    public var lineBreakMode: String?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case buttonType
        case fontDescription
        case state
        case adjustsImageSizeForAccessibilityContentSizeCategory
        case reversesTitleShadowWhenHighlighted
        case showsTouchWhenHighlighted
        case adjustsImageWhenHighlighted
        case adjustsImageWhenDisabled
        case lineBreakMode
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.buttonType = try container.decodeIfPresent(String.self, forKey: .buttonType)
        self.fontDescription = try container.decodeIfPresent(FontDescription.self, forKey: .fontDescription)
        self.state = try container.decodeIfPresent([State].self, forKey: .state)
        self.adjustsImageSizeForAccessibilityContentSizeCategory = try container.decodeIfPresent(String.self, forKey: .adjustsImageSizeForAccessibilityContentSizeCategory)
        self.reversesTitleShadowWhenHighlighted = try container.decodeIfPresent(String.self, forKey: .reversesTitleShadowWhenHighlighted)
        self.showsTouchWhenHighlighted = try container.decodeIfPresent(String.self, forKey: .showsTouchWhenHighlighted)
        self.adjustsImageWhenHighlighted = try container.decodeIfPresent(String.self, forKey: .adjustsImageWhenHighlighted)
        self.adjustsImageWhenDisabled = try container.decodeIfPresent(String.self, forKey: .adjustsImageWhenDisabled)
        self.lineBreakMode = try container.decodeIfPresent(String.self, forKey: .lineBreakMode)
        
        try super.init(from: decoder)
    }
        
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(buttonType, forKey: .buttonType)
        try container.encodeIfPresent(fontDescription, forKey: .fontDescription)
        try container.encodeIfPresent(state, forKey: .state)
        try container.encodeIfPresent(adjustsImageSizeForAccessibilityContentSizeCategory, forKey: .adjustsImageSizeForAccessibilityContentSizeCategory)
        try container.encodeIfPresent(reversesTitleShadowWhenHighlighted, forKey: .reversesTitleShadowWhenHighlighted)
        try container.encodeIfPresent(showsTouchWhenHighlighted, forKey: .showsTouchWhenHighlighted)
        try container.encodeIfPresent(adjustsImageWhenHighlighted, forKey: .adjustsImageWhenHighlighted)
        try container.encodeIfPresent(adjustsImageWhenDisabled, forKey: .adjustsImageWhenDisabled)
        try container.encodeIfPresent(lineBreakMode, forKey: .lineBreakMode)

        try super.encode(to: encoder)
    }

}

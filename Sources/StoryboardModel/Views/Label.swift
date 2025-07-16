//
//  Label.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Label: View {
    
    // MARK: - Text
    
    public var text: String?
    
    public var attributedString: AttributedString?

    // MARK: - Font
    
    public var fontDescription: FontDescription?
    
    // MARK: - Aliginment
    
    public var textAlignment: String?
    
    // MARK: - Lines
    
    public var numberOfLines: String?
        
    // MARK: - Baseline
    
    public var baselineAdjustment: String?
    
    // MARK: - LineBreak

    public var lineBreakMode: String?

    // MARK: - Autoshrink

    public var adjustsFontSizeToFit: String?
    
    public var adjustsLetterSpacingToFitWidth: String?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case text
        case attributedString
        case fontDescription
        case textAlignment
        case numberOfLines
        case baselineAdjustment
        case lineBreakMode
        case adjustsFontSizeToFit
        case adjustsLetterSpacingToFitWidth
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.attributedString = try container.decodeIfPresent(AttributedString.self, forKey: .attributedString)
        self.fontDescription = try container.decodeIfPresent(FontDescription.self, forKey: .fontDescription)
        self.textAlignment = try container.decodeIfPresent(String.self, forKey: .textAlignment)
        self.numberOfLines = try container.decodeIfPresent(String.self, forKey: .numberOfLines)
        self.baselineAdjustment = try container.decodeIfPresent(String.self, forKey: .baselineAdjustment)
        self.lineBreakMode = try container.decodeIfPresent(String.self, forKey: .lineBreakMode)
        self.adjustsFontSizeToFit = try container.decodeIfPresent(String.self, forKey: .adjustsFontSizeToFit)
        self.adjustsLetterSpacingToFitWidth = try container.decodeIfPresent(String.self, forKey: .adjustsLetterSpacingToFitWidth)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(attributedString, forKey: .attributedString)
        try container.encodeIfPresent(fontDescription, forKey: .fontDescription)
        try container.encodeIfPresent(textAlignment, forKey: .textAlignment)
        try container.encodeIfPresent(numberOfLines, forKey: .numberOfLines)
        try container.encodeIfPresent(baselineAdjustment, forKey: .baselineAdjustment)
        try container.encodeIfPresent(lineBreakMode, forKey: .lineBreakMode)
        try container.encodeIfPresent(adjustsFontSizeToFit, forKey: .adjustsFontSizeToFit)
        try container.encodeIfPresent(adjustsLetterSpacingToFitWidth, forKey: .adjustsLetterSpacingToFitWidth)

        try super.encode(to: encoder)
    }

}

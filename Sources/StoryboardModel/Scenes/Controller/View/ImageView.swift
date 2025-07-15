//
//  ImageView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class ImageView: View {
    
    // MARK: - Image
    
    public var image: String?
    
    // MARK: - Highlighted
    
    public var highlightedImage: String?
    
    // MARK: - Accessibility
    
    public var adjustsImageSizeForAccessibilityContentSizeCategory: String?    // NO
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case image
        case highlightedImage
        case adjustsImageSizeForAccessibilityContentSizeCategory
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.highlightedImage = try container.decodeIfPresent(String.self, forKey: .highlightedImage)
        self.adjustsImageSizeForAccessibilityContentSizeCategory = try container.decodeIfPresent(String.self, forKey: .adjustsImageSizeForAccessibilityContentSizeCategory)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(highlightedImage, forKey: .highlightedImage)
        try container.encodeIfPresent(adjustsImageSizeForAccessibilityContentSizeCategory, forKey: .adjustsImageSizeForAccessibilityContentSizeCategory)

        try super.encode(to: encoder)
    }

}

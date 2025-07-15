//
//  NavigationBar.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class NavigationBar: View {
    
    // MARK: - Style
    
    public var barStyle: String?   // Default
    
    public var translucent: String?    // YES
    
    public var largeTitles: String?    // NO
    
    // MARK: - Shadow Image
    
    public var shadowImage: String?
    
    // MARK: - Back Image
    
    public var backIndicatorImage: String?
    
    // MARK: - Back Mask Image
    
    public var backIndicatorTransitionMaskImage: String?
    
    // MARK: - Title Text Attributes
    
    public var textAttributes: [TextAttributes]?
    
    // MARK: -  Items

    public var items: [NavigationItem]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case barStyle
        case translucent
        case largeTitles
        case shadowImage
        case backIndicatorImage
        case backIndicatorTransitionMaskImage
        case textAttributes
        case items
    }
    
    private enum ItemsKeys: String, CodingKey {
        case navigationItem
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.barStyle = try container.decodeIfPresent(String.self, forKey: .barStyle)
        self.translucent = try container.decodeIfPresent(String.self, forKey: .translucent)
        self.largeTitles = try container.decodeIfPresent(String.self, forKey: .largeTitles)
        self.shadowImage = try container.decodeIfPresent(String.self, forKey: .shadowImage)
        self.backIndicatorImage = try container.decodeIfPresent(String.self, forKey: .backIndicatorImage)
        self.backIndicatorTransitionMaskImage = try container.decodeIfPresent(String.self, forKey: .backIndicatorTransitionMaskImage)
        self.textAttributes = try container.decodeIfPresent([TextAttributes].self, forKey: .textAttributes)

        if container.contains(.items) {
            let itemsContainer = try container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
            
            if let items = try itemsContainer.decodeIfPresent([NavigationItem].self, forKey: .navigationItem) {
                self.items = items
            }
        }
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(barStyle, forKey: .barStyle)
        try container.encodeIfPresent(translucent, forKey: .translucent)
        try container.encodeIfPresent(largeTitles, forKey: .largeTitles)
        try container.encodeIfPresent(shadowImage, forKey: .shadowImage)
        try container.encodeIfPresent(backIndicatorImage, forKey: .backIndicatorImage)
        try container.encodeIfPresent(backIndicatorTransitionMaskImage, forKey: .backIndicatorTransitionMaskImage)
        try container.encodeIfPresent(textAttributes, forKey: .textAttributes)

        if let items = items {
            var itemsContainer = container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
            try itemsContainer.encode(items, forKey: .navigationItem)
        }
        
        try super.encode(to: encoder)
    }

}

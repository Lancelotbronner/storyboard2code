//
//  TabBar.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TabBar: View {
    
    // MARK: - Background

    public var backgroundImage: String?
    
    public var shadowImage: String?
    
    public var selectionIndicatorImage: String?
    
    // MARK: - Style

    public var barStyle: String?
    
    public var translucent: String?
    
    // MARK: - Item positioning
    
    public var itemPositioning: String?
    
    // MARK: - Items

    public var items: [TabBarItem]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case backgroundImage
        case shadowImage
        case selectionIndicatorImage
        case barStyle
        case translucent
        case items
    }
    
    private enum ItemsKeys: String, CodingKey {
        case tabBarItem
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        self.shadowImage = try container.decodeIfPresent(String.self, forKey: .shadowImage)
        self.selectionIndicatorImage = try container.decodeIfPresent(String.self, forKey: .selectionIndicatorImage)
        self.barStyle = try container.decodeIfPresent(String.self, forKey: .barStyle)
        self.translucent = try container.decodeIfPresent(String.self, forKey: .translucent)

        if container.contains(.items) {
            let itemsContainer = try container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
            
            if let items = try itemsContainer.decodeIfPresent([TabBarItem].self, forKey: .tabBarItem) {
                self.items = items
            }
        }
        
        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(backgroundImage, forKey: .backgroundImage)
        try container.encodeIfPresent(shadowImage, forKey: .shadowImage)
        try container.encodeIfPresent(selectionIndicatorImage, forKey: .selectionIndicatorImage)
        try container.encodeIfPresent(barStyle, forKey: .barStyle)
        try container.encodeIfPresent(translucent, forKey: .translucent)

        if let items = items {
            var itemsContainer = container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
            try itemsContainer.encode(items, forKey: .tabBarItem)
        }

        try super.encode(to: encoder)
    }

}

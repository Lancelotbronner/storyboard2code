//
//  Toolbar.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Toolbar: View {
    
    // MARK: - Style
    
    public var barStyle: String?   // default
    
    public var translucent: String?    // YES
    
    // MARK: - Items

    public var items: [BarButtonItem]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case barStyle
        case translucent
        case items
    }
    
    private enum ItemsKeys: String, CodingKey {
        case barButtonItem
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.barStyle = try container.decodeIfPresent(String.self, forKey: .barStyle)
        self.translucent = try container.decodeIfPresent(String.self, forKey: .translucent)

        if container.contains(.items) {
            let itemsContainer = try container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
            
            if let items = try itemsContainer.decodeIfPresent([BarButtonItem].self, forKey: .barButtonItem) {
                self.items = items
            }
        }
        
        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(barStyle, forKey: .barStyle)
        try container.encodeIfPresent(translucent, forKey: .translucent)

        if let items = items {
            var itemsContainer = container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
            try itemsContainer.encode(items, forKey: .barButtonItem)
        }

        try super.encode(to: encoder)
    }

}

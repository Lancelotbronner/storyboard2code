//
//  TabBarController.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TabBarController: ViewController {
    
    // MARK: - Tabbar

    public var tabBar: TabBar
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case tabBar
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tabBar = try container.decode(TabBar.self, forKey: .tabBar)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tabBar, forKey: .tabBar)
        
        try super.encode(to: encoder)
    }

}

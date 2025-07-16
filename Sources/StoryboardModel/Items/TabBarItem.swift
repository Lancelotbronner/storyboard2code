//
//  TabBarItem.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TabBarItem: Codable {
    
    public var id: String
    
    public var style: String?
    
    public var systemItem: String?
    
    public var color: Color?

    public var springLoaded: String?
    
    public var image: String?
        
    public var landscapeImage: String?
    
    public var largeContentSizeImage: String?

    public var tag: String?

    public var enabled: String?

}

//
//  NavigationItem.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class NavigationItem: Codable {

    public var id: String
    
    public var title: String?
    
    public var prompt: String?
    
    public var leftItemsSupplementBackButton: String?
    
    public var largeTitleDisplayMode: String?
    
    // MARK: - Bar Button Items
    
    public var leftBarButtonItems: LeftBarButtonItems?
    
    public var rightBarButtonItems: RightBarButtonItems?

    public var barButtonItem: [BarButtonItem]?

}

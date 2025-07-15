//
//  BarButtonItem.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class BarButtonItem: Codable {
    
    public var id: String
    
    public var key: String?

    // MARK: - Style
    
    public var style: String?
    
    // MARK: - System Item
    
    public var systemItem: String?

    // MARK: - Tint
    
    public var color: Color?
    
    // MARK: - Drag and Drop
    
    public var springLoaded: String?

    // MARK: - Title
    
    public var title: String?

    // MARK: - Image
    
    public var image: String?
    
    // MARK: - Landscape Image

    public var landscapeImage: String?
    
    // MARK: - Accessibility

    public var largeContentSizeImage: String?
    
    // MARK: - Tag

    public var tag: String?
    
    // MARK: - View
    
    public var view: View?

}

//
//  TextAttributes.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TextAttributes: Codable {

    public var key: String
    
    public var fontDescription: FontDescription?
    
    public var color: [Color]?
    
    public var offsetWrapper: OffsetWrapper?

}

//
//  CollectionViewFlowLayout.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class CollectionViewFlowLayout: Codable {

    public var id: String

    public var key: String

    public var minimumLineSpacing: String?
    
    public var minimumInteritemSpacing: String?
    
    public var size: [Size]?
    
    public var inset: Inset?
    
}

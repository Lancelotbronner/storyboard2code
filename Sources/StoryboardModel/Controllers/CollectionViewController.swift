//
//  CollectionViewController.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class CollectionViewController: ViewController {
    
    // MARK: - Selection
    
    public var clearsSelectionOnViewWillAppear: String?
    
    // MARK: - CollectionView

    public var collectionView: CollectionView
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case clearsSelectionOnViewWillAppear
        case collectionView
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clearsSelectionOnViewWillAppear = try container.decodeIfPresent(String.self, forKey: .clearsSelectionOnViewWillAppear)
        self.collectionView = try container.decode(CollectionView.self, forKey: .collectionView)
        
        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(clearsSelectionOnViewWillAppear, forKey: .clearsSelectionOnViewWillAppear)
        try container.encode(collectionView, forKey: .collectionView)
        
        try super.encode(to: encoder)
    }

}

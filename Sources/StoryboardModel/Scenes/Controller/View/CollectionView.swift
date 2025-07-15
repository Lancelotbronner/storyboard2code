//
//  CollectionView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class CollectionView: View {

    public var dataMode: String?
    
    // MARK: - Layout
    
    public var collectionViewFlowLayout: CollectionViewFlowLayout?
    
    // MARK: - Accessories
    
    public var collectionReusableView: [CollectionReusableView]?
    
    // MARK: - Prefetch
    
    public var prefetchingEnabled: String? // YES
    
    // MARK: - Cells
    
    public var cells: [CollectionViewCell]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case dataMode
        case collectionViewFlowLayout
        case collectionReusableView
        case prefetchingEnabled
        case cells
    }
    
    private enum CellsKeys: String, CodingKey {
        case collectionViewCell
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dataMode = try container.decodeIfPresent(String.self, forKey: .dataMode)
        self.collectionViewFlowLayout = try container.decodeIfPresent(CollectionViewFlowLayout.self, forKey: .collectionViewFlowLayout)
        self.collectionReusableView = try container.decodeIfPresent([CollectionReusableView].self, forKey: .collectionReusableView)
        self.prefetchingEnabled = try container.decodeIfPresent(String.self, forKey: .prefetchingEnabled)

        if container.contains(.cells) {
            let cellsContainer = try container.nestedContainer(keyedBy: CellsKeys.self, forKey: .cells)
            self.cells = try cellsContainer.decodeIfPresent([CollectionViewCell].self, forKey: .collectionViewCell)
        }

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(dataMode, forKey: .dataMode)
        try container.encodeIfPresent(collectionViewFlowLayout, forKey: .collectionViewFlowLayout)
        try container.encodeIfPresent(collectionReusableView, forKey: .collectionReusableView)
        try container.encodeIfPresent(prefetchingEnabled, forKey: .prefetchingEnabled)

        if let cells = cells {
            var cellsContainer = container.nestedContainer(keyedBy: CellsKeys.self, forKey: .cells)
            try cellsContainer.encode(cells, forKey: .collectionViewCell)
        }

        try super.encode(to: encoder)
    }

}

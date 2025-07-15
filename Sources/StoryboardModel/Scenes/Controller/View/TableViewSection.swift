//
//  TableViewSection.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TableViewSection: Codable {

    public var id: String

    public var headerTitle: String?

    public var footerTitle: String?
    
    public var cells: [TableViewCell]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case headerTitle
        case footerTitle
        case cells
    }
    
    private enum CellsKeys: String, CodingKey {
        case tableViewCell
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.headerTitle = try container.decodeIfPresent(String.self, forKey: .headerTitle)
        self.footerTitle = try container.decodeIfPresent(String.self, forKey: .footerTitle)

        if container.contains(.cells) {
            let cellsContainer = try container.nestedContainer(keyedBy: CellsKeys.self, forKey: .cells)
            self.cells = try cellsContainer.decodeIfPresent([TableViewCell].self, forKey: .tableViewCell)
        }
    }
 
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(headerTitle, forKey: .headerTitle)
        try container.encodeIfPresent(footerTitle, forKey: .footerTitle)

        if let cells = cells {
            var cellsContainer = container.nestedContainer(keyedBy: CellsKeys.self, forKey: .cells)
            try cellsContainer.encode(cells, forKey: .tableViewCell)
        }
    }

}

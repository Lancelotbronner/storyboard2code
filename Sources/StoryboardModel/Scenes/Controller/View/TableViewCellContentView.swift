//
//  TableViewCellContentView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TableViewCellContentView: View {

    public var tableViewCell: String?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case tableViewCell
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tableViewCell = try container.decodeIfPresent(String.self, forKey: .tableViewCell)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(tableViewCell, forKey: .tableViewCell)
        
        try super.encode(to: encoder)
    }

}

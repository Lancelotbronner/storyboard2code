//
//  TableViewController.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TableViewController: ViewController {
    
    // MARK: - Selection
    
    public var clearsSelectionOnViewWillAppear: String?    // YES
    
    // MARK: - Refreshing

    public var refreshControl: RefreshControl?
    
    // MARK: - TableView

    public var tableView: TableView
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case clearsSelectionOnViewWillAppear
        case refreshControl
        case tableView
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clearsSelectionOnViewWillAppear = try container.decodeIfPresent(String.self, forKey: .clearsSelectionOnViewWillAppear)
        self.refreshControl = try container.decodeIfPresent(RefreshControl.self, forKey: .refreshControl)
        self.tableView = try container.decode(TableView.self, forKey: .tableView)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(clearsSelectionOnViewWillAppear, forKey: .clearsSelectionOnViewWillAppear)
        try container.encodeIfPresent(refreshControl, forKey: .refreshControl)
        try container.encode(tableView, forKey: .tableView)

        try super.encode(to: encoder)
    }

}

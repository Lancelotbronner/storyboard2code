//
//  ViewController.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class ViewController: Codable {
    
    // MARK: - Identity
    
    public var id: String

    public var sceneMemberID: String
    
    // MARK: - Custom Class
    
    public var customClass: String?
    
    public var customModule: String?

    // MARK: - Title
    
    public var title: String?
    
    // MARK: - Layout
    
    public var automaticallyAdjustsScrollViewInsets: String?   // YES

    public var hidesBottomBarWhenPushed: String?   // NO

    public var autoresizesArchivedViewToFullSize: String?  // YES

    public var wantsFullScreenLayout: String?  // NO
    
    // MARK: - Extended Edges

    public var extendedEdge: ExtendedEdge?

    public var extendedLayoutIncludesOpaqueBars: String?   // NO
    
    // MARK: - Transition Style

    public var modalTransitionStyle: String?
    
    // MARK: - View

    public var view: View?
    
    // MARK: - Connections
    
    public var connections: [Connection]?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case sceneMemberID
        case customClass
        case customModule
        case title
        case automaticallyAdjustsScrollViewInsets
        case hidesBottomBarWhenPushed
        case autoresizesArchivedViewToFullSize
        case wantsFullScreenLayout
        case extendedEdge
        case extendedLayoutIncludesOpaqueBars
        case modalTransitionStyle
        case view
        case connections
    }
    
    private enum ConnectionsKeys: String, CodingKey {
        case outlet
        case outletCollection
        case segue
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.sceneMemberID = try container.decode(String.self, forKey: .sceneMemberID)
        self.customClass = try container.decodeIfPresent(String.self, forKey: .customClass)
        self.customModule = try container.decodeIfPresent(String.self, forKey: .customModule)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.automaticallyAdjustsScrollViewInsets = try container.decodeIfPresent(String.self, forKey: .automaticallyAdjustsScrollViewInsets)
        self.hidesBottomBarWhenPushed = try container.decodeIfPresent(String.self, forKey: .hidesBottomBarWhenPushed)
        self.autoresizesArchivedViewToFullSize = try container.decodeIfPresent(String.self, forKey: .autoresizesArchivedViewToFullSize)
        self.wantsFullScreenLayout = try container.decodeIfPresent(String.self, forKey: .wantsFullScreenLayout)
        self.extendedEdge = try container.decodeIfPresent(ExtendedEdge.self, forKey: .extendedEdge)
        self.extendedLayoutIncludesOpaqueBars = try container.decodeIfPresent(String.self, forKey: .extendedLayoutIncludesOpaqueBars)
        self.modalTransitionStyle = try container.decodeIfPresent(String.self, forKey: .modalTransitionStyle)
        self.view = try container.decodeIfPresent(View.self, forKey: .view)
        
        if container.contains(.connections) {
            let connectionsContainer = try container.nestedContainer(keyedBy: ConnectionsKeys.self, forKey: .connections)

            var connections = [Connection]()
            if let items = try connectionsContainer.decodeIfPresent([Outlet].self, forKey: .outlet) {
                connections.append(contentsOf: items)
            }
            if let items = try connectionsContainer.decodeIfPresent([OutletCollection].self, forKey: .outletCollection) {
                connections.append(contentsOf: items)
            }
            if let items = try connectionsContainer.decodeIfPresent([Segue].self, forKey: .segue) {
                connections.append(contentsOf: items)
            }

            self.connections = connections
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(sceneMemberID, forKey: .sceneMemberID)
        try container.encodeIfPresent(customClass, forKey: .customClass)
        try container.encodeIfPresent(customModule, forKey: .customModule)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(automaticallyAdjustsScrollViewInsets, forKey: .automaticallyAdjustsScrollViewInsets)
        try container.encodeIfPresent(hidesBottomBarWhenPushed, forKey: .hidesBottomBarWhenPushed)
        try container.encodeIfPresent(autoresizesArchivedViewToFullSize, forKey: .autoresizesArchivedViewToFullSize)
        try container.encodeIfPresent(wantsFullScreenLayout, forKey: .wantsFullScreenLayout)
        try container.encodeIfPresent(extendedEdge, forKey: .extendedEdge)
        try container.encodeIfPresent(extendedLayoutIncludesOpaqueBars, forKey: .extendedLayoutIncludesOpaqueBars)
        try container.encodeIfPresent(modalTransitionStyle, forKey: .modalTransitionStyle)
        try container.encodeIfPresent(view, forKey: .view)
        
        if let connections = connections {
            var connectionsContainer = container.nestedContainer(keyedBy: ConnectionsKeys.self, forKey: .connections)
            
            let outlets = connections.filter({ type(of: $0) == Outlet.self })
            if outlets.isEmpty == false {
                try connectionsContainer.encode(outlets, forKey: .outlet)
            }

            let outletCollections = connections.filter({ type(of: $0) == OutletCollection.self })
            if outletCollections.isEmpty == false {
                try connectionsContainer.encode(outletCollections, forKey: .outletCollection)
            }

            let segues = connections.filter({ type(of: $0) == Segue.self })
            if segues.isEmpty == false {
                try connectionsContainer.encode(segues, forKey: .segue)
            }
        }
    }

}

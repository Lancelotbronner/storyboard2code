//
//  TapGestureRecognizer.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TapGestureRecognizer: Codable {
    
    public var id: String
    
    public var connections: [Connection]?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case connections
    }
    
    private enum ConnectionsKeys: String, CodingKey {
        case action
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        
        if container.contains(.connections) {
            let connectionsContainer = try container.nestedContainer(keyedBy: ConnectionsKeys.self, forKey: .connections)
            
            var connections = [Connection]()
            if let items = try connectionsContainer.decodeIfPresent([Action].self, forKey: .action) {
                connections.append(contentsOf: items)
            }
            
            self.connections = connections
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        
        if let connections = connections {
            var connectionsContainer = container.nestedContainer(keyedBy: ConnectionsKeys.self, forKey: .connections)
            
            let actions = connections.filter({ type(of: $0) == Action.self })
            if actions.isEmpty == false {
                try connectionsContainer.encode(actions, forKey: .action)
            }
        }
    }

}

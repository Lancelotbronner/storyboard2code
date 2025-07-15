//
//  Segue.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Segue: Connection {

    public var id: String

    public var kind: String?

    public var destination: String?

    public var relationship: String?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case kind
        case destination
        case relationship
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.destination = try container.decodeIfPresent(String.self, forKey: .destination)
        self.relationship = try container.decodeIfPresent(String.self, forKey: .relationship)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(kind, forKey: .kind)
        try container.encodeIfPresent(destination, forKey: .destination)
        try container.encodeIfPresent(relationship, forKey: .relationship)

        try super.encode(to: encoder)
    }

}

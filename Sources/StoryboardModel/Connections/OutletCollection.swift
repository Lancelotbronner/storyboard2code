//
//  OutletCollection.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class OutletCollection: Connection {
    
    public var id: String
    
    public var property: String?

    public var destination: String?
    
    public var collectionClass: String?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case property
        case destination
        case collectionClass
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.property = try container.decodeIfPresent(String.self, forKey: .property)
        self.destination = try container.decodeIfPresent(String.self, forKey: .destination)
        self.collectionClass = try container.decodeIfPresent(String.self, forKey: .collectionClass)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(property, forKey: .property)
        try container.encodeIfPresent(destination, forKey: .destination)
        try container.encodeIfPresent(collectionClass, forKey: .collectionClass)

        try super.encode(to: encoder)
    }

}

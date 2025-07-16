//
//  Action.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Action: Connection {
    
    public var id: String
    
    public var selector: String?

    public var destination: String?
    
    public var eventType: String?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case selector
        case destination
        case eventType
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.selector = try container.decodeIfPresent(String.self, forKey: .selector)
        self.destination = try container.decodeIfPresent(String.self, forKey: .destination)
        self.eventType = try container.decodeIfPresent(String.self, forKey: .eventType)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(selector, forKey: .selector)
        try container.encodeIfPresent(destination, forKey: .destination)
        try container.encodeIfPresent(eventType, forKey: .eventType)

        try super.encode(to: encoder)
    }

}

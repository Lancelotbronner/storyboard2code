//
//  Switch.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Switch: View {
    
    // MARK: - State
    
    public var on: String?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case on
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.on = try container.decodeIfPresent(String.self, forKey: .on)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(on, forKey: .on)

        try super.encode(to: encoder)
    }

}

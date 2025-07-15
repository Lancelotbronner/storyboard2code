//
//  CollectionReusableView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class CollectionReusableView: View {
    
    // MARK: - Identifier
    
    public var reuseIdentifier: String?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case reuseIdentifier
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reuseIdentifier = try container.decodeIfPresent(String.self, forKey: .reuseIdentifier)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(reuseIdentifier, forKey: .reuseIdentifier)
        
        try super.encode(to: encoder)
    }

}

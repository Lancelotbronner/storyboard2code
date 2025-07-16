//
//  RefreshControl.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class RefreshControl: View {
    
    // MARK: - Title
    
    public var attributedString: AttributedString?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case attributedString
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributedString = try container.decodeIfPresent(AttributedString.self, forKey: .attributedString)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(attributedString, forKey: .attributedString)
        
        try super.encode(to: encoder)
    }

}

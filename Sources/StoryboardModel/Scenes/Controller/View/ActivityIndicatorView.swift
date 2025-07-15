//
//  ActivityIndicatorView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class ActivityIndicatorView: View {
    
    // MARK: - Style

    public var style: String?
    
    // MARK: - Behavior
    
    public var animating: String?  // NO

    public var hidesWhenStopped: String?   // NO
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case style
        case animating
        case hidesWhenStopped
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.style = try container.decodeIfPresent(String.self, forKey: .style)
        self.animating = try container.decodeIfPresent(String.self, forKey: .animating)
        self.hidesWhenStopped = try container.decodeIfPresent(String.self, forKey: .hidesWhenStopped)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(style, forKey: .style)
        try container.encodeIfPresent(animating, forKey: .animating)
        try container.encodeIfPresent(hidesWhenStopped, forKey: .hidesWhenStopped)

        try super.encode(to: encoder)
    }

}

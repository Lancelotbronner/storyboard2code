//
//  CollectionViewCell.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class CollectionViewCell: View {
    
    // MARK: - Identifier

    public var reuseIdentifier: String?

    // MARK: - View

    public var view: View?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case reuseIdentifier
        case view
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reuseIdentifier = try container.decodeIfPresent(String.self, forKey: .reuseIdentifier)
        self.view = try container.decodeIfPresent(View.self, forKey: .view)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(reuseIdentifier, forKey: .reuseIdentifier)
        try container.encode(view, forKey: .view)

        try super.encode(to: encoder)
    }

}

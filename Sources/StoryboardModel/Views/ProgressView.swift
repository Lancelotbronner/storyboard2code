//
//  ProgressView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class ProgressView: View {
    
    // MARK: - Style
    
    public var progressViewStyle: String?   // Default
    
    // MARK: - Progress

    public var progress: String?
    
    // MARK: - Pgoress Image
    
    public var progressImage: String?
    
    // MARK: - Track Image
    
    public var trackImage: String?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case progressViewStyle
        case progress
        case progressImage
        case trackImage
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.progressViewStyle = try container.decodeIfPresent(String.self, forKey: .progressViewStyle)
        self.progress = try container.decodeIfPresent(String.self, forKey: .progress)
        self.progressImage = try container.decodeIfPresent(String.self, forKey: .progressImage)
        self.trackImage = try container.decodeIfPresent(String.self, forKey: .trackImage)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(progressViewStyle, forKey: .progressViewStyle)
        try container.encodeIfPresent(progress, forKey: .progress)
        try container.encodeIfPresent(progressImage, forKey: .progressImage)
        try container.encodeIfPresent(trackImage, forKey: .trackImage)

        try super.encode(to: encoder)
    }

}

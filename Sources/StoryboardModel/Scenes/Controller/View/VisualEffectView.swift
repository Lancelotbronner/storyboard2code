//
//  VisualEffectView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 1/18/19.
//

import Foundation

class VisualEffectView: View {
    
    // MARK: - View
    
    public var view: View?
    
    public var vibrancyEffect: VibrancyEffect?
    
    public var blurEffect: BlurEffect?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case view
        case vibrancyEffect
        case blurEffect
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.view = try container.decodeIfPresent(View.self, forKey: .view)
        self.vibrancyEffect = try container.decodeIfPresent(VibrancyEffect.self, forKey: .vibrancyEffect)
        self.blurEffect = try container.decodeIfPresent(BlurEffect.self, forKey: .blurEffect)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(view, forKey: .view)
        try container.encode(vibrancyEffect, forKey: .vibrancyEffect)
        try container.encode(blurEffect, forKey: .blurEffect)
        
        try super.encode(to: encoder)
    }

}

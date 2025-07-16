//
//  WkWebView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class WkWebView: View {
    
    // MARK: - User Agent

    public var customUserAgent: String?
    
    // MARK: - Interaction

    public var allowsBackForwardNavigationGestures: String?

    // MARK: - Display
    
    public var allowsLinkPreview: String?
    
    // MARK: - Configuration

    public var wkWebViewConfiguration: WkWebViewConfiguration?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case customUserAgent
        case allowsBackForwardNavigationGestures
        case allowsLinkPreview
        case wkWebViewConfiguration
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customUserAgent = try container.decodeIfPresent(String.self, forKey: .customUserAgent)
        self.allowsBackForwardNavigationGestures = try container.decodeIfPresent(String.self, forKey: .allowsBackForwardNavigationGestures)
        self.allowsLinkPreview = try container.decodeIfPresent(String.self, forKey: .allowsLinkPreview)
        self.wkWebViewConfiguration = try container.decodeIfPresent(WkWebViewConfiguration.self, forKey: .wkWebViewConfiguration)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(customUserAgent, forKey: .customUserAgent)
        try container.encodeIfPresent(allowsBackForwardNavigationGestures, forKey: .allowsBackForwardNavigationGestures)
        try container.encodeIfPresent(allowsLinkPreview, forKey: .allowsLinkPreview)
        try container.encodeIfPresent(wkWebViewConfiguration, forKey: .wkWebViewConfiguration)
        
        try super.encode(to: encoder)
    }
}

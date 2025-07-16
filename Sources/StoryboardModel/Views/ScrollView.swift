//
//  ScrollView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class ScrollView: View {
    
    // MARK: - Indicators
    
    public var indicatorStyle: String? // Default Style
    
    public var showsHorizontalScrollIndicator: String? // YES

    public var showsVerticalScrollIndicator: String?   // YES

    // MARK: - Scrolling
    
    public var scrollEnabled: String? // YES

    public var pagingEnabled: String? // NO

    public var directionalLockEnabled: String? // NO
    
    // MARK: - Bounce
    
    public var bounces: String? // NO

    public var alwaysBounceVertical: String? // YES

    public var alwaysBounceHorizontal: String? // YES

    public var bouncesZoom: String? // NO
    
    // MARK: - Zoom
    
    public var minimumZoomScale: String?   // 1
    
    public var maximumZoomScale: String?   // 1
    
    // MARK: - Content Touch
    
    public var delaysContentTouches: String? // NO
    
    public var canCancelContentTouches: String? // NO
    
    // MARK: - Keyboard
    
    public var keyboardDismissMode: String?    // Do not dismiss
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case indicatorStyle
        case showsHorizontalScrollIndicator
        case showsVerticalScrollIndicator
        case scrollEnabled
        case pagingEnabled
        case directionalLockEnabled
        case bounces
        case alwaysBounceVertical
        case alwaysBounceHorizontal
        case bouncesZoom
        case minimumZoomScale
        case maximumZoomScale
        case delaysContentTouches
        case canCancelContentTouches
        case keyboardDismissMode
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.indicatorStyle = try container.decodeIfPresent(String.self, forKey: .indicatorStyle)
        self.showsHorizontalScrollIndicator = try container.decodeIfPresent(String.self, forKey: .showsHorizontalScrollIndicator)
        self.showsVerticalScrollIndicator = try container.decodeIfPresent(String.self, forKey: .showsVerticalScrollIndicator)
        self.scrollEnabled = try container.decodeIfPresent(String.self, forKey: .scrollEnabled)
        self.pagingEnabled = try container.decodeIfPresent(String.self, forKey: .pagingEnabled)
        self.directionalLockEnabled = try container.decodeIfPresent(String.self, forKey: .directionalLockEnabled)
        self.bounces = try container.decodeIfPresent(String.self, forKey: .bounces)
        self.alwaysBounceVertical = try container.decodeIfPresent(String.self, forKey: .alwaysBounceVertical)
        self.alwaysBounceHorizontal = try container.decodeIfPresent(String.self, forKey: .alwaysBounceHorizontal)
        self.bouncesZoom = try container.decodeIfPresent(String.self, forKey: .bouncesZoom)
        self.minimumZoomScale = try container.decodeIfPresent(String.self, forKey: .minimumZoomScale)
        self.maximumZoomScale = try container.decodeIfPresent(String.self, forKey: .maximumZoomScale)
        self.delaysContentTouches = try container.decodeIfPresent(String.self, forKey: .delaysContentTouches)
        self.canCancelContentTouches = try container.decodeIfPresent(String.self, forKey: .canCancelContentTouches)
        self.keyboardDismissMode = try container.decodeIfPresent(String.self, forKey: .keyboardDismissMode)

        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(indicatorStyle, forKey: .indicatorStyle)
        try container.encodeIfPresent(showsHorizontalScrollIndicator, forKey: .showsHorizontalScrollIndicator)
        try container.encodeIfPresent(showsVerticalScrollIndicator, forKey: .showsVerticalScrollIndicator)
        try container.encodeIfPresent(scrollEnabled, forKey: .scrollEnabled)
        try container.encodeIfPresent(pagingEnabled, forKey: .pagingEnabled)
        try container.encodeIfPresent(directionalLockEnabled, forKey: .directionalLockEnabled)
        try container.encodeIfPresent(bounces, forKey: .bounces)
        try container.encodeIfPresent(alwaysBounceVertical, forKey: .alwaysBounceVertical)
        try container.encodeIfPresent(alwaysBounceHorizontal, forKey: .alwaysBounceHorizontal)
        try container.encodeIfPresent(bouncesZoom, forKey: .bouncesZoom)
        try container.encodeIfPresent(minimumZoomScale, forKey: .minimumZoomScale)
        try container.encodeIfPresent(maximumZoomScale, forKey: .maximumZoomScale)
        try container.encodeIfPresent(delaysContentTouches, forKey: .delaysContentTouches)
        try container.encodeIfPresent(canCancelContentTouches, forKey: .canCancelContentTouches)
        try container.encodeIfPresent(keyboardDismissMode, forKey: .keyboardDismissMode)
        
        try super.encode(to: encoder)
    }

}

//
//  NavigationController.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class NavigationController: ViewController {

    // MARK: - Bar Visibility
    
    public var navigationBarHidden: String?
    
    // MARK: - Hide Bars

    public var hidesBarsOnSwipe: String?    // NO

    public var hidesBarsOnTap: String?  // NO
    
    public var hidesBarsWhenKeyboardAppears: String?   // NO

    public var hidesBarsWhenVerticallyCompact: String?   // NO
    
    // MARK: - NavigationBar and Toolbar

    public var navigationBar: NavigationBar
    
    public var toolbar: Toolbar?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case navigationBarHidden
        case hidesBarsOnSwipe
        case hidesBarsOnTap
        case hidesBarsWhenKeyboardAppears
        case hidesBarsWhenVerticallyCompact
        case navigationBar
        case toolbar
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.navigationBarHidden = try container.decodeIfPresent(String.self, forKey: .navigationBarHidden)
        self.hidesBarsOnSwipe = try container.decodeIfPresent(String.self, forKey: .hidesBarsOnSwipe)
        self.hidesBarsOnTap = try container.decodeIfPresent(String.self, forKey: .hidesBarsOnTap)
        self.hidesBarsWhenKeyboardAppears = try container.decodeIfPresent(String.self, forKey: .hidesBarsWhenKeyboardAppears)
        self.hidesBarsWhenVerticallyCompact = try container.decodeIfPresent(String.self, forKey: .hidesBarsWhenVerticallyCompact)
        self.navigationBar = try container.decode(NavigationBar.self, forKey: .navigationBar)
        self.toolbar = try container.decodeIfPresent(Toolbar.self, forKey: .toolbar)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(navigationBarHidden, forKey: .navigationBarHidden)
        try container.encodeIfPresent(hidesBarsOnSwipe, forKey: .hidesBarsOnSwipe)
        try container.encodeIfPresent(hidesBarsOnTap, forKey: .hidesBarsOnTap)
        try container.encodeIfPresent(hidesBarsWhenKeyboardAppears, forKey: .hidesBarsWhenKeyboardAppears)
        try container.encodeIfPresent(hidesBarsWhenVerticallyCompact, forKey: .hidesBarsWhenVerticallyCompact)
        try container.encode(navigationBar, forKey: .navigationBar)
        try container.encodeIfPresent(toolbar, forKey: .toolbar)
        
        try super.encode(to: encoder)
    }

}

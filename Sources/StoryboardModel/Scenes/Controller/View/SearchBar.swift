//
//  SearchBar.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class SearchBar: View {
    
    // MARK: - Text
    
    public var text: String?
    
    // MARK: - Placeholder
    
    public var placeholder: String?
    
    // MARK: - Prompt
    
    public var prompt: String?
    
    // MARK: - Search Style
    
    public var searchBarStyle: String?
    
    // MARK: - Bar Sty;e

    public var barStyle: String?
    
    public var translucent: String?    // YES
    
    // MARK: - Background Image
    
    public var backgroundImage: String?
    
    // MARK: - Scope Bar Image
    
    public var scopeBarBackgroundImage: String?
    
    // MARK: - Offset
    
    public var offsetWrapper: [OffsetWrapper]?
    
    // MARK: - Capabilities
    
    public var showsSearchResultsButton: String?  // NO
    
    public var showsBookmarkButton: String?  // NO
    
    public var showsCancelButton: String?  // NO
    
    // MARK: - Scope Bar Titles
    
    public var scopeButtonTitles: ScopeButtonTitles?

    // MARK: - Text Input Traits
    
    public var textInputTraits: TextInputTraits?

    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case text
        case placeholder
        case prompt
        case searchBarStyle
        case barStyle
        case translucent
        case backgroundImage
        case scopeBarBackgroundImage
        case offsetWrapper
        case showsSearchResultsButton
        case showsBookmarkButton
        case showsCancelButton
        case scopeButtonTitles
        case textInputTraits
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.placeholder = try container.decodeIfPresent(String.self, forKey: .placeholder)
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
        self.searchBarStyle = try container.decodeIfPresent(String.self, forKey: .searchBarStyle)
        self.barStyle = try container.decodeIfPresent(String.self, forKey: .barStyle)
        self.translucent = try container.decodeIfPresent(String.self, forKey: .translucent)
        self.backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        self.scopeBarBackgroundImage = try container.decodeIfPresent(String.self, forKey: .scopeBarBackgroundImage)
        self.offsetWrapper = try container.decodeIfPresent([OffsetWrapper].self, forKey: .offsetWrapper)
        self.showsSearchResultsButton = try container.decodeIfPresent(String.self, forKey: .showsSearchResultsButton)
        self.showsBookmarkButton = try container.decodeIfPresent(String.self, forKey: .showsBookmarkButton)
        self.showsCancelButton = try container.decodeIfPresent(String.self, forKey: .showsCancelButton)
        self.scopeButtonTitles = try container.decodeIfPresent(ScopeButtonTitles.self, forKey: .scopeButtonTitles)
        self.textInputTraits = try container.decodeIfPresent(TextInputTraits.self, forKey: .textInputTraits)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(prompt, forKey: .prompt)
        try container.encodeIfPresent(searchBarStyle, forKey: .searchBarStyle)
        try container.encodeIfPresent(barStyle, forKey: .barStyle)
        try container.encodeIfPresent(translucent, forKey: .translucent)
        try container.encodeIfPresent(backgroundImage, forKey: .backgroundImage)
        try container.encodeIfPresent(scopeBarBackgroundImage, forKey: .scopeBarBackgroundImage)
        try container.encodeIfPresent(offsetWrapper, forKey: .offsetWrapper)
        try container.encodeIfPresent(showsSearchResultsButton, forKey: .showsSearchResultsButton)
        try container.encodeIfPresent(showsBookmarkButton, forKey: .showsBookmarkButton)
        try container.encodeIfPresent(showsCancelButton, forKey: .showsCancelButton)
        try container.encodeIfPresent(scopeButtonTitles, forKey: .scopeButtonTitles)
        try container.encodeIfPresent(textInputTraits, forKey: .textInputTraits)
        
        try super.encode(to: encoder)
    }

}

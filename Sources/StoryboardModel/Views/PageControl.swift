//
//  PageControl.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class PageControl: View {
    
    // MARK: - Pages

    public var numberOfPages: String?
    
    public var currentPage: String?

    // MARK: - Behavior
    
    public var hidesForSinglePage: String? // NO
    
    public var defersCurrentPageDisplay: String?   // NO
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case numberOfPages
        case currentPage
        case hidesForSinglePage
        case defersCurrentPageDisplay
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numberOfPages = try container.decodeIfPresent(String.self, forKey: .numberOfPages)
        self.currentPage = try container.decodeIfPresent(String.self, forKey: .currentPage)
        self.hidesForSinglePage = try container.decodeIfPresent(String.self, forKey: .hidesForSinglePage)
        self.defersCurrentPageDisplay = try container.decodeIfPresent(String.self, forKey: .defersCurrentPageDisplay)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(numberOfPages, forKey: .numberOfPages)
        try container.encodeIfPresent(currentPage, forKey: .currentPage)
        try container.encodeIfPresent(hidesForSinglePage, forKey: .hidesForSinglePage)
        try container.encodeIfPresent(defersCurrentPageDisplay, forKey: .defersCurrentPageDisplay)

        try super.encode(to: encoder)
    }

}

//
//  TableView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TableView: ScrollView {
    
    // MARK: - Content
    
    public var dataMode: String?   // Dynamic

    public var prototypes: [TableViewCell]?    // for Dynamic
    
    public var sections: [TableViewSection]?   // for Static

    // MARK: - Style

    public var style: String?  // plain
    
    // MARK: - Separator
    
    public var separatorStyle: String?

    // MARK: - Separator Inset
    
    // MARK: - Selection
    
    public var allowsSelection: String?    // YES
    
    public var allowsMultipleSelection: String?    // NO
    
    // MARK: - Editing

    public var allowsSelectionDuringEditing: String?   // NO
    
    public var allowsMultipleSelectionDuringEditing: String?   // NO
    
    // MARK: - Display Limit
    
    public var sectionIndexMinimumDisplayRowCount: String?
    
    // MARK: - Table View
    
    public var rowHeight: String?
    
    public var estimatedRowHeight: String?
    
    // MARK: - Sections
    
    public var sectionHeaderHeight: String?
    
    public var estimatedSectionHeaderHeight: String?
    
    public var sectionFooterHeight: String?
    
    public var estimatedSectionFooterHeight: String?
    
    public var contentViewInsetsToSafeArea: String?
    
    // MARK: - Insets
    
    public var inset: [Inset]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case dataMode
        case prototypes
        case sections
        case style
        case separatorStyle
        case allowsSelection
        case allowsMultipleSelection
        case allowsSelectionDuringEditing
        case allowsMultipleSelectionDuringEditing
        case sectionIndexMinimumDisplayRowCount
        case rowHeight
        case estimatedRowHeight
        case sectionHeaderHeight
        case estimatedSectionHeaderHeight
        case sectionFooterHeight
        case estimatedSectionFooterHeight
        case contentViewInsetsToSafeArea
        case inset
    }
    
    private enum PrototypesKeys: String, CodingKey {
        case tableViewCell
    }

    private enum SectionsKeys: String, CodingKey {
        case tableViewSection
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dataMode = try container.decodeIfPresent(String.self, forKey: .dataMode)

        if container.contains(.prototypes) {
            let prototypesContainer = try container.nestedContainer(keyedBy: PrototypesKeys.self, forKey: .prototypes)
            self.prototypes = try prototypesContainer.decodeIfPresent([TableViewCell].self, forKey: .tableViewCell)
        }

        if container.contains(.sections) {
            let sectionsContainer = try container.nestedContainer(keyedBy: SectionsKeys.self, forKey: .sections)
            self.sections = try sectionsContainer.decodeIfPresent([TableViewSection].self, forKey: .tableViewSection)
        }

        self.style = try container.decodeIfPresent(String.self, forKey: .style)
        self.separatorStyle = try container.decodeIfPresent(String.self, forKey: .separatorStyle)
        self.allowsSelection = try container.decodeIfPresent(String.self, forKey: .allowsSelection)
        self.allowsMultipleSelection = try container.decodeIfPresent(String.self, forKey: .allowsMultipleSelection)
        self.allowsSelectionDuringEditing = try container.decodeIfPresent(String.self, forKey: .allowsSelectionDuringEditing)
        self.allowsMultipleSelectionDuringEditing = try container.decodeIfPresent(String.self, forKey: .allowsMultipleSelectionDuringEditing)
        self.sectionIndexMinimumDisplayRowCount = try container.decodeIfPresent(String.self, forKey: .sectionIndexMinimumDisplayRowCount)
        self.rowHeight = try container.decodeIfPresent(String.self, forKey: .rowHeight)
        self.estimatedRowHeight = try container.decodeIfPresent(String.self, forKey: .estimatedRowHeight)
        self.sectionHeaderHeight = try container.decodeIfPresent(String.self, forKey: .sectionHeaderHeight)
        self.estimatedSectionHeaderHeight = try container.decodeIfPresent(String.self, forKey: .estimatedSectionHeaderHeight)
        self.sectionFooterHeight = try container.decodeIfPresent(String.self, forKey: .sectionFooterHeight)
        self.estimatedSectionFooterHeight = try container.decodeIfPresent(String.self, forKey: .estimatedSectionFooterHeight)
        self.contentViewInsetsToSafeArea = try container.decodeIfPresent(String.self, forKey: .contentViewInsetsToSafeArea)
        self.inset = try container.decodeIfPresent([Inset].self, forKey: .inset)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(dataMode, forKey: .dataMode)

        if let prototypes = prototypes {
            var prototypesContainer = container.nestedContainer(keyedBy: PrototypesKeys.self, forKey: .prototypes)
            try prototypesContainer.encode(prototypes, forKey: .tableViewCell)
        }

        if let sections = sections {
            var sectionsContainer = container.nestedContainer(keyedBy: SectionsKeys.self, forKey: .sections)
            try sectionsContainer.encode(sections, forKey: .tableViewSection)
        }

        try container.encodeIfPresent(style, forKey: .style)
        try container.encodeIfPresent(separatorStyle, forKey: .separatorStyle)
        try container.encodeIfPresent(allowsSelection, forKey: .allowsSelection)
        try container.encodeIfPresent(allowsMultipleSelection, forKey: .allowsMultipleSelection)
        try container.encodeIfPresent(allowsSelectionDuringEditing, forKey: .allowsSelectionDuringEditing)
        try container.encodeIfPresent(allowsMultipleSelectionDuringEditing, forKey: .allowsMultipleSelectionDuringEditing)
        try container.encodeIfPresent(sectionIndexMinimumDisplayRowCount, forKey: .sectionIndexMinimumDisplayRowCount)
        try container.encodeIfPresent(rowHeight, forKey: .rowHeight)
        try container.encodeIfPresent(estimatedRowHeight, forKey: .estimatedRowHeight)
        try container.encodeIfPresent(sectionHeaderHeight, forKey: .sectionHeaderHeight)
        try container.encodeIfPresent(estimatedSectionHeaderHeight, forKey: .estimatedSectionHeaderHeight)
        try container.encodeIfPresent(sectionFooterHeight, forKey: .sectionFooterHeight)
        try container.encodeIfPresent(estimatedSectionFooterHeight, forKey: .estimatedSectionFooterHeight)
        try container.encodeIfPresent(contentViewInsetsToSafeArea, forKey: .contentViewInsetsToSafeArea)
        try container.encodeIfPresent(inset, forKey: .inset)
        
        try super.encode(to: encoder)
    }

}

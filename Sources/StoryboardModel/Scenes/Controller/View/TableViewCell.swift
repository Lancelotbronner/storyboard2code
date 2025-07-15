//
//  TableViewCell.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TableViewCell: View {
    
    // MARK: - Style
    
    public var style: String?
    
    // MARK: - Identifier
    
    public var reuseIdentifier: String?
    
    // MARK: - Selection
    
    public var selectionStyle: String?
    
    // MARK: - Acccessory
    
    public var accessoryType: String?
    
    // MARK: - Editing Acc
    
    public var editingAccessoryType: String?

    // MARK: - Focus STyle
    
    public var focusStyle: String?
    
    // MARK: - Indentation
    
    public var indentationLevel: String?
    
    public var indentationWidth: String?
    
    public var shouldIndentWhileEditing: String?   // YES
    
    public var showsReorderControl: String?    // NO
    
    // MARK: - Separator Inset
    
    public var inset: Inset?
    
    // MARK: - ContentView
    
    public var textLabel: String?
    
    public var detailTextLabel: String?
    
    public var imageView: String?
    
    public var tableViewCellContentView: TableViewCellContentView?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case style
        case reuseIdentifier
        case selectionStyle
        case accessoryType
        case editingAccessoryType
        case focusStyle
        case indentationLevel
        case indentationWidth
        case shouldIndentWhileEditing
        case showsReorderControl
        case inset
        case textLabel
        case detailTextLabel
        case imageView
        case tableViewCellContentView
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.style = try container.decodeIfPresent(String.self, forKey: .style)
        self.reuseIdentifier = try container.decodeIfPresent(String.self, forKey: .reuseIdentifier)
        self.selectionStyle = try container.decodeIfPresent(String.self, forKey: .selectionStyle)
        self.accessoryType = try container.decodeIfPresent(String.self, forKey: .accessoryType)
        self.editingAccessoryType = try container.decodeIfPresent(String.self, forKey: .editingAccessoryType)
        self.focusStyle = try container.decodeIfPresent(String.self, forKey: .focusStyle)
        self.indentationLevel = try container.decodeIfPresent(String.self, forKey: .indentationLevel)
        self.indentationWidth = try container.decodeIfPresent(String.self, forKey: .indentationWidth)
        self.shouldIndentWhileEditing = try container.decodeIfPresent(String.self, forKey: .shouldIndentWhileEditing)
        self.showsReorderControl = try container.decodeIfPresent(String.self, forKey: .showsReorderControl)
        self.inset = try container.decodeIfPresent(Inset.self, forKey: .inset)
        self.textLabel = try container.decodeIfPresent(String.self, forKey: .textLabel)
        self.detailTextLabel = try container.decodeIfPresent(String.self, forKey: .detailTextLabel)
        self.imageView = try container.decodeIfPresent(String.self, forKey: .imageView)
        self.tableViewCellContentView = try container.decodeIfPresent(TableViewCellContentView.self, forKey: .tableViewCellContentView)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(style, forKey: .style)
        try container.encodeIfPresent(reuseIdentifier, forKey: .reuseIdentifier)
        try container.encodeIfPresent(selectionStyle, forKey: .selectionStyle)
        try container.encodeIfPresent(accessoryType, forKey: .accessoryType)
        try container.encodeIfPresent(editingAccessoryType, forKey: .editingAccessoryType)
        try container.encodeIfPresent(focusStyle, forKey: .focusStyle)
        try container.encodeIfPresent(indentationLevel, forKey: .indentationLevel)
        try container.encodeIfPresent(indentationWidth, forKey: .indentationWidth)
        try container.encodeIfPresent(shouldIndentWhileEditing, forKey: .shouldIndentWhileEditing)
        try container.encodeIfPresent(showsReorderControl, forKey: .showsReorderControl)
        try container.encodeIfPresent(inset, forKey: .inset)
        try container.encodeIfPresent(textLabel, forKey: .textLabel)
        try container.encodeIfPresent(detailTextLabel, forKey: .detailTextLabel)
        try container.encodeIfPresent(imageView, forKey: .imageView)
        try container.encodeIfPresent(tableViewCellContentView, forKey: .tableViewCellContentView)

        try super.encode(to: encoder)
    }

}

//
//  View.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class View: Codable {
    
    // MARK: - Identity
    
    public var id: String?
    
    public var key: String?
    
    public var restorationIdentifier: String?
    
    // MARK: - Custom Class
    
    public var customClass: String?
    
    public var customModule: String?

    // MARK: - Content Mode
    
    public var contentMode: String?

    // MARK: - Semantic
    
    public var semanticContentAttribute: String?   // Unspecified

    // MARK: - Tag
    
    public var tag: String?
    
    // MARK: - Interaction
    
    public var userInteractionEnabled: String? // YES
    
    public var multipleTouchEnabled: String?   // NO
    
    // MARK: - Alpha
    
    public var alpha: String?
    
    // MARK: - Background and Tint
    
    public var color: [Color]?
    
    // MARK: - Drawing

    public var opaque: String? // YES

    public var hidden: String? // NO
    
    public var clearsContextBeforeDrawing: String? // YES

    public var clipsSubviews: String?  // NO
    
    public var autoresizesSubviews: String?    // YES
    
    // MARK: - Stretching
    
    public var rect: [Rect]?

    // MARK: - Autoresizing
    
    public var autoresizingMask: AutoresizingMask?

    // MARK: - Layout merging

    public var preservesSuperviewLayoutMargins: String?    // NO
    
    public var layoutMarginsFollowReadableWidth: String?   // NO
    
    public var insetsLayoutMarginsFromSafeArea: String?    // YES
    
    public var viewLayoutGuide: ViewLayoutGuide?
    
    // MARK: - Control

    public var contentHorizontalAlignment: String?
    
    public var contentVerticalAlignment: String?
    
    public var horizontalHuggingPriority: String?
    
    public var verticalHuggingPriority: String?
    
    public var horizontalCompressionResistancePriority: String?
    
    public var verticalCompressionResistancePriority: String?

    public var ambiguous: String?

    public var fixedFrame: String? // NO
    
    // MARK: - Drag and Drop
    
    public var springLoaded: String?
    
    // MARK: - State
    
    public var selected: String?   // NO
    
    public var enabled: String? // YES
    
    public var highlighted: String?    // NO

    // MARK: - Constraints
    
    public var translatesAutoresizingMaskIntoConstraints: String?

    public var constraints: [Constraint]?
    
    public var variation: [Variation]?

    // MARK: - Connections
    
    public var connections: [Connection]?

    // MARK: - Subviews

    public var subviews: [View]?
    
    // MARK: - SortOrder
    
    public var sortOrder: String?
    
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case id
        case key
        case restorationIdentifier
        case customClass
        case customModule
        case contentMode
        case semanticContentAttribute
        case tag
        case userInteractionEnabled
        case multipleTouchEnabled
        case alpha
        case color
        case opaque
        case hidden
        case clearsContextBeforeDrawing
        case clipsSubviews
        case autoresizesSubviews
        case rect
        case autoresizingMask
        case preservesSuperviewLayoutMargins
        case layoutMarginsFollowReadableWidth
        case insetsLayoutMarginsFromSafeArea
        case viewLayoutGuide
        case contentHorizontalAlignment
        case contentVerticalAlignment
        case horizontalHuggingPriority
        case verticalHuggingPriority
        case horizontalCompressionResistancePriority
        case verticalCompressionResistancePriority
        case ambiguous
        case fixedFrame
        case springLoaded
        case selected
        case enabled
        case highlighted
        case translatesAutoresizingMaskIntoConstraints
        case constraints
        case variation
        case connections
        case subviews
        case sortOrder
    }

    private enum ConstraintsKeys: String, CodingKey {
        case constraint
    }

    private enum SubviewsKeys: String, CodingKey, CaseIterable {
        case view
        case label
        case button
        case segmentedControl
        case textField
        case slider
        case `switch`
        case activityIndicatorView
        case progressView
        case pageControl
        case stepper
        case imageView
        case textView
        case datePicker
        case pickerView
        case mapView
        case wkWebView
        case searchBar
        case navigationBar
        case toolbar
        case tabBar
        case scrollView
        case tableView
        case collectionView
        case containerView
        case stackView
        case visualEffectView

        public var classType: View.Type {
            switch self {
            case .view:
                return View.self
            case .label:
                return Label.self
            case .button:
                return SegmentedControl.self
            case .segmentedControl:
                return SegmentedControl.self
            case .textField:
                return TextField.self
            case .slider:
                return Slider.self
            case .switch:
                return Switch.self
            case .activityIndicatorView:
                return ActivityIndicatorView.self
            case .progressView:
                return ProgressView.self
            case .pageControl:
                return PageControl.self
            case .stepper:
                return Stepper.self
            case .imageView:
                return ImageView.self
            case .textView:
                return TextView.self
            case .datePicker:
                return DatePicker.self
            case .pickerView:
                return PickerView.self
            case .mapView:
                return MapView.self
            case .wkWebView:
                return WkWebView.self
            case .searchBar:
                return SearchBar.self
            case .navigationBar:
                return NavigationBar.self
            case .toolbar:
                return Toolbar.self
            case .tabBar:
                return TabBar.self
            case .scrollView:
                return ScrollView.self
            case .tableView:
                return TableView.self
            case .collectionView:
                return CollectionView.self
            case .containerView:
                return ContainerView.self
            case .stackView:
                return StackView.self
            case .visualEffectView:
                return VisualEffectView.self
            }
        }

        func decode(container: KeyedDecodingContainer<SubviewsKeys>) throws -> [View]? {
            switch self {
            case .view:
                return try container.decodeIfPresent([View].self, forKey: self)
            case .label:
                return try container.decodeIfPresent([Label].self, forKey: self)
            case .button:
                return try container.decodeIfPresent([Button].self, forKey: self)
            case .segmentedControl:
                return try container.decodeIfPresent([SegmentedControl].self, forKey: self)
            case .textField:
                return try container.decodeIfPresent([TextField].self, forKey: self)
            case .slider:
                return try container.decodeIfPresent([Slider].self, forKey: self)
            case .switch:
                return try container.decodeIfPresent([Switch].self, forKey: self)
            case .activityIndicatorView:
                return try container.decodeIfPresent([ActivityIndicatorView].self, forKey: self)
            case .progressView:
                return try container.decodeIfPresent([ProgressView].self, forKey: self)
            case .pageControl:
                return try container.decodeIfPresent([PageControl].self, forKey: self)
            case .stepper:
                return try container.decodeIfPresent([Stepper].self, forKey: self)
            case .imageView:
                return try container.decodeIfPresent([ImageView].self, forKey: self)
            case .textView:
                return try container.decodeIfPresent([TextView].self, forKey: self)
            case .datePicker:
                return try container.decodeIfPresent([DatePicker].self, forKey: self)
            case .pickerView:
                return try container.decodeIfPresent([PickerView].self, forKey: self)
            case .mapView:
                return try container.decodeIfPresent([MapView].self, forKey: self)
            case .wkWebView:
                return try container.decodeIfPresent([WkWebView].self, forKey: self)
            case .searchBar:
                return try container.decodeIfPresent([SearchBar].self, forKey: self)
            case .navigationBar:
                return try container.decodeIfPresent([NavigationBar].self, forKey: self)
            case .toolbar:
                return try container.decodeIfPresent([Toolbar].self, forKey: self)
            case .tabBar:
                return try container.decodeIfPresent([TabBar].self, forKey: self)
            case .scrollView:
                return try container.decodeIfPresent([ScrollView].self, forKey: self)
            case .tableView:
                return try container.decodeIfPresent([TableView].self, forKey: self)
            case .collectionView:
                return try container.decodeIfPresent([CollectionView].self, forKey: self)
            case .containerView:
                return try container.decodeIfPresent([ContainerView].self, forKey: self)
            case .stackView:
                return try container.decodeIfPresent([StackView].self, forKey: self)
            case .visualEffectView:
                return try container.decodeIfPresent([VisualEffectView].self, forKey: self)
            }
        }

    }
    
    private enum ConnectionsKeys: String, CodingKey {
        case outlet
        case outletCollection
        case segue
        case action
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.restorationIdentifier = try container.decodeIfPresent(String.self, forKey: .restorationIdentifier)
        self.customClass = try container.decodeIfPresent(String.self, forKey: .customClass)
        self.customModule = try container.decodeIfPresent(String.self, forKey: .customModule)
        self.contentMode = try container.decodeIfPresent(String.self, forKey: .contentMode)
        self.semanticContentAttribute = try container.decodeIfPresent(String.self, forKey: .semanticContentAttribute)
        self.tag = try container.decodeIfPresent(String.self, forKey: .tag)
        self.userInteractionEnabled = try container.decodeIfPresent(String.self, forKey: .userInteractionEnabled)
        self.multipleTouchEnabled = try container.decodeIfPresent(String.self, forKey: .multipleTouchEnabled)
        self.alpha = try container.decodeIfPresent(String.self, forKey: .alpha)
        self.color = try container.decodeIfPresent([Color].self, forKey: .color)
        self.opaque = try container.decodeIfPresent(String.self, forKey: .opaque)
        self.hidden = try container.decodeIfPresent(String.self, forKey: .hidden)
        self.clearsContextBeforeDrawing = try container.decodeIfPresent(String.self, forKey: .clearsContextBeforeDrawing)
        self.clipsSubviews = try container.decodeIfPresent(String.self, forKey: .clipsSubviews)
        self.autoresizesSubviews = try container.decodeIfPresent(String.self, forKey: .autoresizesSubviews)
        self.rect = try container.decodeIfPresent([Rect].self, forKey: .rect)
        self.autoresizingMask = try container.decodeIfPresent(AutoresizingMask.self, forKey: .autoresizingMask)
        self.preservesSuperviewLayoutMargins = try container.decodeIfPresent(String.self, forKey: .preservesSuperviewLayoutMargins)
        self.layoutMarginsFollowReadableWidth = try container.decodeIfPresent(String.self, forKey: .layoutMarginsFollowReadableWidth)
        self.insetsLayoutMarginsFromSafeArea = try container.decodeIfPresent(String.self, forKey: .insetsLayoutMarginsFromSafeArea)
        self.viewLayoutGuide = try container.decodeIfPresent(ViewLayoutGuide.self, forKey: .viewLayoutGuide)
        self.contentHorizontalAlignment = try container.decodeIfPresent(String.self, forKey: .contentHorizontalAlignment)
        self.contentVerticalAlignment = try container.decodeIfPresent(String.self, forKey: .contentVerticalAlignment)
        self.horizontalHuggingPriority = try container.decodeIfPresent(String.self, forKey: .horizontalHuggingPriority)
        self.verticalHuggingPriority = try container.decodeIfPresent(String.self, forKey: .verticalHuggingPriority)
        self.horizontalCompressionResistancePriority = try container.decodeIfPresent(String.self, forKey: .horizontalCompressionResistancePriority)
        self.verticalCompressionResistancePriority = try container.decodeIfPresent(String.self, forKey: .verticalCompressionResistancePriority)
        self.ambiguous = try container.decodeIfPresent(String.self, forKey: .ambiguous)
        self.fixedFrame = try container.decodeIfPresent(String.self, forKey: .fixedFrame)
        self.springLoaded = try container.decodeIfPresent(String.self, forKey: .springLoaded)
        self.selected = try container.decodeIfPresent(String.self, forKey: .selected)
        self.enabled = try container.decodeIfPresent(String.self, forKey: .enabled)
        self.highlighted = try container.decodeIfPresent(String.self, forKey: .highlighted)
        self.translatesAutoresizingMaskIntoConstraints = try container.decodeIfPresent(String.self, forKey: .translatesAutoresizingMaskIntoConstraints)
        self.sortOrder = try container.decodeIfPresent(String.self, forKey: .sortOrder)

        if container.contains(.constraints) {
            let constraintsContainer = try container.nestedContainer(keyedBy: ConstraintsKeys.self, forKey: .constraints)
            self.constraints = try constraintsContainer.decodeIfPresent([Constraint].self, forKey: .constraint)
        }
        
        self.variation = try container.decodeIfPresent([Variation].self, forKey: .variation)

        if container.contains(.connections) {
            let connectionsContainer = try container.nestedContainer(keyedBy: ConnectionsKeys.self, forKey: .connections)
            
            var connections = [Connection]()
            if let items = try connectionsContainer.decodeIfPresent([Outlet].self, forKey: .outlet) {
                connections.append(contentsOf: items)
            }
            if let items = try connectionsContainer.decodeIfPresent([OutletCollection].self, forKey: .outletCollection) {
                connections.append(contentsOf: items)
            }
            if let items = try connectionsContainer.decodeIfPresent([Segue].self, forKey: .segue) {
                connections.append(contentsOf: items)
            }
            if let items = try connectionsContainer.decodeIfPresent([Action].self, forKey: .action) {
                connections.append(contentsOf: items)
            }

            self.connections = connections
        }
        
        if container.contains(.subviews) {
            var subviews = [View]()
            
            let subviewsContainer = try container.nestedContainer(keyedBy: SubviewsKeys.self, forKey: .subviews)

            try subviewsContainer.allKeys.forEach { (key) in
                if let items = try key.decode(container: subviewsContainer) {
                    subviews.append(contentsOf: items)
                }
            }
            
            subviews.sort { (lhs, rhs) -> Bool in
                return lhs.sortOrder ?? "0" < rhs.sortOrder ?? "0"
            }

            self.subviews = subviews
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(restorationIdentifier, forKey: .restorationIdentifier)
        try container.encodeIfPresent(customClass, forKey: .customClass)
        try container.encodeIfPresent(customModule, forKey: .customModule)
        try container.encodeIfPresent(contentMode, forKey: .contentMode)
        try container.encodeIfPresent(semanticContentAttribute, forKey: .semanticContentAttribute)
        try container.encodeIfPresent(tag, forKey: .tag)
        try container.encodeIfPresent(userInteractionEnabled, forKey: .userInteractionEnabled)
        try container.encodeIfPresent(multipleTouchEnabled, forKey: .multipleTouchEnabled)
        try container.encodeIfPresent(alpha, forKey: .alpha)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(opaque, forKey: .opaque)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(clearsContextBeforeDrawing, forKey: .clearsContextBeforeDrawing)
        try container.encodeIfPresent(clipsSubviews, forKey: .clipsSubviews)
        try container.encodeIfPresent(autoresizesSubviews, forKey: .autoresizesSubviews)
        try container.encodeIfPresent(rect, forKey: .rect)
        try container.encodeIfPresent(autoresizingMask, forKey: .autoresizingMask)
        try container.encodeIfPresent(preservesSuperviewLayoutMargins, forKey: .preservesSuperviewLayoutMargins)
        try container.encodeIfPresent(layoutMarginsFollowReadableWidth, forKey: .layoutMarginsFollowReadableWidth)
        try container.encodeIfPresent(insetsLayoutMarginsFromSafeArea, forKey: .insetsLayoutMarginsFromSafeArea)
        try container.encodeIfPresent(viewLayoutGuide, forKey: .viewLayoutGuide)
        try container.encodeIfPresent(contentHorizontalAlignment, forKey: .contentHorizontalAlignment)
        try container.encodeIfPresent(contentVerticalAlignment, forKey: .contentVerticalAlignment)
        try container.encodeIfPresent(horizontalHuggingPriority, forKey: .horizontalHuggingPriority)
        try container.encodeIfPresent(verticalHuggingPriority, forKey: .verticalHuggingPriority)
        try container.encodeIfPresent(horizontalCompressionResistancePriority, forKey: .horizontalCompressionResistancePriority)
        try container.encodeIfPresent(verticalCompressionResistancePriority, forKey: .verticalCompressionResistancePriority)
        try container.encodeIfPresent(ambiguous, forKey: .ambiguous)
        try container.encodeIfPresent(fixedFrame, forKey: .fixedFrame)
        try container.encodeIfPresent(springLoaded, forKey: .springLoaded)
        try container.encodeIfPresent(selected, forKey: .selected)
        try container.encodeIfPresent(enabled, forKey: .enabled)
        try container.encodeIfPresent(highlighted, forKey: .highlighted)
        try container.encodeIfPresent(translatesAutoresizingMaskIntoConstraints, forKey: .translatesAutoresizingMaskIntoConstraints)
        
        if let constraints = constraints {
            var constraintsContainer = container.nestedContainer(keyedBy: ConstraintsKeys.self, forKey: .constraints)
            try constraintsContainer.encode(constraints, forKey: .constraint)
        }

        try container.encodeIfPresent(variation, forKey: .variation)

        if let connections = connections {
            var connectionsContainer = container.nestedContainer(keyedBy: ConnectionsKeys.self, forKey: .connections)
            
            let outlets = connections.filter({ type(of: $0) == Outlet.self })
            if outlets.isEmpty == false {
                try connectionsContainer.encode(outlets, forKey: .outlet)
            }
            
            let outletCollections = connections.filter({ type(of: $0) == OutletCollection.self })
            if outletCollections.isEmpty == false {
                try connectionsContainer.encode(outletCollections, forKey: .outletCollection)
            }
            
            let segues = connections.filter({ type(of: $0) == Segue.self })
            if segues.isEmpty == false {
                try connectionsContainer.encode(segues, forKey: .segue)
            }

            let actions = connections.filter({ type(of: $0) == Action.self })
            if actions.isEmpty == false {
                try connectionsContainer.encode(actions, forKey: .action)
            }
        }

        if let subviews = subviews {
            var subviewsContainer = container.nestedContainer(keyedBy: SubviewsKeys.self, forKey: .subviews)

            try SubviewsKeys.allCases.forEach { (key) in
                let views = subviews.filter({ type(of: $0) == key.classType })
                if views.isEmpty == false {
                    try subviewsContainer.encode(views, forKey: key)
                }
            }
        }
    }
    
}

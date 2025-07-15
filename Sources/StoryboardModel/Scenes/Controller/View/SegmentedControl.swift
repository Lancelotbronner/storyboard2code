//
//  SegmentedControl.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class SegmentedControl: View {
    
    // MARK: - Style

    public var segmentControlStyle: String

    // MARK: - State
    
    public var momentary: String?  // NO
    
    // MARK: - Segments
    
    public var segments: [Segment]?

    public var selectedSegmentIndex: String

    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case segmentControlStyle
        case momentary
        case segments
        case selectedSegmentIndex
    }

    private enum SegmentsKeys: String, CodingKey {
        case segment
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.segmentControlStyle = try container.decode(String.self, forKey: .segmentControlStyle)
        self.momentary = try container.decodeIfPresent(String.self, forKey: .momentary)

        if container.contains(.segments) {
            let segmentsContainer = try container.nestedContainer(keyedBy: SegmentsKeys.self, forKey: .segments)
            
            if let items = try segmentsContainer.decodeIfPresent([Segment].self, forKey: .segment) {
                self.segments = items
            }
        }

        self.selectedSegmentIndex = try container.decode(String.self, forKey: .selectedSegmentIndex)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(segmentControlStyle, forKey: .segmentControlStyle)
        try container.encodeIfPresent(momentary, forKey: .momentary)

        if let segments = segments {
            var segmentsContainer = container.nestedContainer(keyedBy: SegmentsKeys.self, forKey: .segments)
            try segmentsContainer.encode(segments, forKey: .segment)
        }

        try container.encodeIfPresent(selectedSegmentIndex, forKey: .selectedSegmentIndex)

        try super.encode(to: encoder)
    }

}

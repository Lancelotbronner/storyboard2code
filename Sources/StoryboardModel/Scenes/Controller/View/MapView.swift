//
//  MapView.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class MapView: View {
    
    // MARK: - Type
    
    public var mapType: String
    
    // MARK: - Allows

    public var zoomEnabled: String?    // YES
    
    public var scrollEnabled: String?  // YES
    
    public var rotateEnabled: String?  // YES
    
    public var pitchEnabled: String?   // YES

    // MARK: - Shows
    
    public var showsBuildings: String? // YES
    
    public var showsCompass: String?   // YES
    
    public var showsScale: String? // NO
    
    public var showsTraffic: String?   // NO

    public var showsPointsOfInterest: String?  // YES

    public var showsUserLocation: String?  // NO
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case mapType
        case zoomEnabled
        case scrollEnabled
        case rotateEnabled
        case pitchEnabled
        case showsBuildings
        case showsCompass
        case showsScale
        case showsTraffic
        case showsPointsOfInterest
        case showsUserLocation
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mapType = try container.decode(String.self, forKey: .mapType)
        self.zoomEnabled = try container.decodeIfPresent(String.self, forKey: .zoomEnabled)
        self.scrollEnabled = try container.decodeIfPresent(String.self, forKey: .scrollEnabled)
        self.rotateEnabled = try container.decodeIfPresent(String.self, forKey: .rotateEnabled)
        self.pitchEnabled = try container.decodeIfPresent(String.self, forKey: .pitchEnabled)
        self.showsBuildings = try container.decodeIfPresent(String.self, forKey: .showsBuildings)
        self.showsCompass = try container.decodeIfPresent(String.self, forKey: .showsCompass)
        self.showsScale = try container.decodeIfPresent(String.self, forKey: .showsScale)
        self.showsTraffic = try container.decodeIfPresent(String.self, forKey: .showsTraffic)
        self.showsPointsOfInterest = try container.decodeIfPresent(String.self, forKey: .showsPointsOfInterest)
        self.showsUserLocation = try container.decodeIfPresent(String.self, forKey: .showsUserLocation)
        
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mapType, forKey: .mapType)
        try container.encodeIfPresent(zoomEnabled, forKey: .zoomEnabled)
        try container.encodeIfPresent(scrollEnabled, forKey: .scrollEnabled)
        try container.encodeIfPresent(rotateEnabled, forKey: .rotateEnabled)
        try container.encodeIfPresent(pitchEnabled, forKey: .pitchEnabled)
        try container.encodeIfPresent(showsBuildings, forKey: .showsBuildings)
        try container.encodeIfPresent(showsCompass, forKey: .showsCompass)
        try container.encodeIfPresent(showsScale, forKey: .showsScale)
        try container.encodeIfPresent(showsTraffic, forKey: .showsTraffic)
        try container.encodeIfPresent(showsPointsOfInterest, forKey: .showsPointsOfInterest)
        try container.encodeIfPresent(showsUserLocation, forKey: .showsUserLocation)

        try super.encode(to: encoder)
    }
    
}

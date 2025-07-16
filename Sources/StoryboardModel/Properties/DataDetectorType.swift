//
//  DataDetectorType.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class DataDetectorType: Codable {
    
    public var key: String

    public var phoneNumber: String?   // NO

    public var link: String?   // NO
    
    public var address: String?   // NO
    
    public var calendarEvent: String?   // NO

    public var shipmentTrackingNumber: String?   // NO

    public var flightNumber: String?   // NO

    public var lookupSuggestion: String?   // NO

}

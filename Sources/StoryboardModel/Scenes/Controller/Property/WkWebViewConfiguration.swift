//
//  WkWebViewConfiguration.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class WkWebViewConfiguration: Codable {

    public var key: String?

    // MARK: - App Name
    
    public var applicationNameForUserAgent: String?

    // MARK: - Selection

    public var selectionGranularity: String?
    
    // MARK: - Display
    
    public var suppressesIncrementalRendering: String?

    // MARK: - Media
    public var allowsAirPlayForMediaPlayback: String?  // YES

    public var allowsInlineMediaPlayback: String?  // NO

    public var allowsPictureInPictureMediaPlayback: String?    // YES

    // MARK: - Data Detectors

    public var dataDetectorTypes: DataDetectorTypes?
    
    public var audiovisualMediaTypes: AudiovisualMediaTypes?
    
    // MARK: - Preference

    public var wkPreferences: WkPreferences?
}

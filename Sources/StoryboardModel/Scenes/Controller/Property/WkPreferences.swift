//
//  WkPreferences.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class WkPreferences: Codable {
    
    public var key: String
    
    // MARK: - Minimum Font Size
    
    public var minimumFontSize: String?
    
    // MARK: - Javascript

    public var javaScriptEnabled: String?  // YES
    
    public var javaScriptCanOpenWindowsAutomatically: String?  // NO
    

}

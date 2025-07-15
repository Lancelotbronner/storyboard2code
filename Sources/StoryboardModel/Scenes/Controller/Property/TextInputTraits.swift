//
//  TextInputTraits.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class TextInputTraits: Codable {
    
    public var key: String

    public var textContentType: String?

    public var autocapitalizationType: String?

    public var autocorrectionType: String?

    public var smartDashesType: String?

    public var smartInsertDeleteType: String?

    public var smartQuotesType: String?

    public var spellCheckingType: String?

    public var keyboardType: String?

    public var keyboardAppearance: String?

    public var returnKeyType: String?

    public var enablesReturnKeyAutomatically: String?

    public var secureTextEntry: String?

}

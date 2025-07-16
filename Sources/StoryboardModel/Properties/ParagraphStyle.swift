//
//  ParagraphStyle.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class ParagraphStyle: Codable {

    public var key: String

    public var alignment: String?

    public var lineBreakMode: String?

    public var baseWritingDirection: String?

    public var tighteningFactorForTruncation: String?

}

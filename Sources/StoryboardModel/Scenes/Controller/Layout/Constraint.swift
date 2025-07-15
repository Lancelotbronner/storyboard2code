//
//  Constraint.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Constraint: Codable {

    public var id: String

    public var firstItem: String?

    public var firstAttribute: String?

    public var secondItem: String?

    public var secondAttribute: String?

    public var relation: String?
    
    public var multiplier: String?

    public var constant: String?
    
    public var priority: String?

    public var identifier: String?

}

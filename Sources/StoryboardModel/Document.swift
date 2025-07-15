//
//  Document.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Document: Codable {
    
    // MARK: - Scenes
    
    public var scenes: [Scene]?
    
    // MARK: - Resources
    
    public var resources: [Image]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case scenes
        case resources
    }
    
    private enum ScenesKeys: String, CodingKey {
        case scene
    }
    
    private enum ResourcesKeys: String, CodingKey {
        case image
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.contains(.scenes) {
            let scenesContainer = try container.nestedContainer(keyedBy: ScenesKeys.self, forKey: .scenes)
            self.scenes = try scenesContainer.decodeIfPresent([Scene].self, forKey: .scene)
        }
        
        if container.contains(.resources) {
            let resourcesContainer = try container.nestedContainer(keyedBy: ResourcesKeys.self, forKey: .resources)
            self.resources = try resourcesContainer.decodeIfPresent([Image].self, forKey: .image)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if let scenes = scenes {
            var scenesContainer = container.nestedContainer(keyedBy: ScenesKeys.self, forKey: .scenes)
            try scenesContainer.encode(scenes, forKey: .scene)
        }
        
        if let resources = resources {
            var resourcesContainer = container.nestedContainer(keyedBy: ResourcesKeys.self, forKey: .resources)
            try resourcesContainer.encode(resources, forKey: .image)
        }
    }
    
}

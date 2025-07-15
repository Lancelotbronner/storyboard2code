//
//  Scene.swift
//  StoryboardModel
//
//  Created by Watanabe Toshinori on 11/26/18.
//

import Foundation

public class Scene: Codable {
    
    // MARK: - Identity
    
    public var sceneID: String
    
    // MARK: - ViewController
    
    public var viewController: ViewController?
    
    public var tapGestureRecognizer: [TapGestureRecognizer]?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case sceneID
        case objects
    }
    
    private enum ObjectKeys: String, CodingKey {
        case viewController
        case navigationController
        case tableViewController
        case collectionViewController
        case tabBarController
        case splitViewController
        case viewControllerPlaceholder
        case tapGestureRecognizer
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sceneID = try container.decode(String.self, forKey: .sceneID)
        
        if container.contains(.objects) {
            let objectsContainer = try container.nestedContainer(keyedBy: ObjectKeys.self, forKey: .objects)
            
            if objectsContainer.contains(.viewController) {
                self.viewController = try objectsContainer.decodeIfPresent(ViewController.self, forKey: .viewController)
            }
            if objectsContainer.contains(.navigationController) {
                self.viewController = try objectsContainer.decodeIfPresent(NavigationController.self, forKey: .navigationController)
            }
            if objectsContainer.contains(.tableViewController) {
                self.viewController = try objectsContainer.decodeIfPresent(TableViewController.self, forKey: .tableViewController)
            }
            if objectsContainer.contains(.collectionViewController) {
                self.viewController = try objectsContainer.decodeIfPresent(CollectionViewController.self, forKey: .collectionViewController)
            }
            if objectsContainer.contains(.tabBarController) {
                self.viewController = try objectsContainer.decodeIfPresent(TabBarController.self, forKey: .tabBarController)
            }
            if objectsContainer.contains(.splitViewController) {
                self.viewController = try objectsContainer.decodeIfPresent(SplitViewController.self, forKey: .splitViewController)
            }
            if objectsContainer.contains(.viewControllerPlaceholder) {
                self.viewController = try objectsContainer.decodeIfPresent(ViewControllerPlaceholder.self, forKey: .viewControllerPlaceholder)
            }
            if objectsContainer.contains(.tapGestureRecognizer) {
               self.tapGestureRecognizer = try objectsContainer.decodeIfPresent([TapGestureRecognizer].self, forKey: .tapGestureRecognizer)
            }
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sceneID, forKey: .sceneID)

        var objectsContainer = container.nestedContainer(keyedBy: ObjectKeys.self, forKey: .objects)

        if let viewController = viewController {
            if type(of: viewController) == ViewController.self {
                try objectsContainer.encode(viewController, forKey: .viewController)
            }
            if type(of: viewController) == NavigationController.self {
                try objectsContainer.encode(viewController, forKey: .navigationController)
            }
            if type(of: viewController) == TableViewController.self {
                try objectsContainer.encode(viewController, forKey: .tableViewController)
            }
            if type(of: viewController) == CollectionViewController.self {
                try objectsContainer.encode(viewController, forKey: .collectionViewController)
            }
            if type(of: viewController) == TabBarController.self {
                try objectsContainer.encode(viewController, forKey: .tabBarController)
            }
            if type(of: viewController) == SplitViewController.self {
                try objectsContainer.encode(viewController, forKey: .splitViewController)
            }
            if type(of: viewController) == ViewControllerPlaceholder.self {
                try objectsContainer.encode(viewController, forKey: .viewControllerPlaceholder)
            }
        }
        
        if let gestureRecognizers = tapGestureRecognizer {
            try objectsContainer.encode(gestureRecognizers, forKey: .tapGestureRecognizer)
        }
    }
    
}

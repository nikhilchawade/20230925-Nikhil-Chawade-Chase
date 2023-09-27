//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import UIKit

protocol StoryboardInstantiable: AnyObject {
    associatedtype T
    static var storyboardName: String { get }
    static func instantiateViewController(_ bundle: Bundle?) -> T
}

extension StoryboardInstantiable where Self: BaseViewController {
    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = storyboardName
        let storyboard = UIStoryboard(name: fileName, bundle: bundle)
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {

            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fileName)")
        }
        return vc
    }
}

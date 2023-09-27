//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation
import UIKit

protocol WeatherFlowCoordinatorContract: AnyObject {
    func start()
}

final class WeatherFlowCoordinator: WeatherFlowCoordinatorContract {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard let searchVC = SearchBuilder().build(flowCoordinator: self) as? SearchViewController else {
            return
        }
        navigationController.pushViewController(searchVC, animated: false)
    }
}

//
//  BaseViewController.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation

final class SearchBuilder {
    private let view: SearchViewContract
    private var viewModel: SearchViewModelContract

    init(view: SearchViewContract = SearchViewController.instantiateViewController(),
         viewModel: SearchViewModelContract = SearchViewModel()) {
        self.view = view
        self.viewModel = viewModel
    }

    func build(flowCoordinator: WeatherFlowCoordinatorContract) -> SearchViewContract {
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.flowCoordinator = flowCoordinator
        return view
    }
}

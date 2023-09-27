//
//  SearchPresenterMock.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 26/09/23.
//

import XCTest
@testable import _0230925_Nikhil_Chawade_Chase

final class SearchPresenterMock: SearchViewModelContract {
    var imageUrl: URL?
    var flowCoordinator: WeatherFlowCoordinatorContract?
    var view: SearchViewContract?

    func viewLoaded() {
    }
    
    func searchText(text: String?) {
    }
}

//
//  SearchViewModelTests.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 27/09/23.
//

import XCTest
@testable import _0230925_Nikhil_Chawade_Chase

final class WeatherFlowCoordinatorMock: WeatherFlowCoordinatorContract {
    var startCalled = false

    func start() {
        startCalled = true
    }
}

class SearchViewModelTests: XCTestCase {
    let viewModel = SearchViewModel()
    let mockView = SearchViewMock()
    var flowCoordinatorMock = WeatherFlowCoordinatorMock()

    override func setUp() {
        super.setUp()
        viewModel.view = mockView
        viewModel.flowCoordinator = flowCoordinatorMock
        viewModel.searchData = nil
    }

    private func commonSetup() {
        let dummyModel = getWeatherInformationModel()
        viewModel.searchData = dummyModel
    }

    func testSearchText() {
        let dummyModel = getWeatherInformationModel()
        viewModel.useCase = WeatherUsecaseMock(mockResponse: dummyModel)
        viewModel.searchText(text: "seattle")
        XCTAssertNotNil(mockView.state)
    }

    func getWeatherInformationModel() -> WeatherInformationModel {
        let wind = WindModel(deg: 37.0, speed: 14.0)
        let coord = CoordinatesModel(lon: 24.0, lat: 71.0)
        let detailModel = WeatherDetailModel(feelsLike: 38.0,
                                             humidity: 6,
                                             pressure: 4,
                                             temp: 37.0,
                                             temp_max: 39.0,
                                             temp_min: 29.0)
        return WeatherInformationModel(id: 1,
                                       main: detailModel,
                                       name: "name",
                                       coord: coord,
                                       weather: [],
                                       wind: wind)
    }
}

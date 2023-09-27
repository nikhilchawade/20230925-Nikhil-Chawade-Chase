//
//  WeatherUsecaseTests.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 26/09/23.
//

import XCTest
@testable import _0230925_Nikhil_Chawade_Chase

class WeatherUsecaseTests: XCTestCase {
    var useCase: WeatherUsecase!
    
    func testUseCaseSuccess() {
        useCase = WeatherUsecase(provider: APIProviderMock(mockResponse: WeatherInformationModel(id: 1, main: nil, name: "name", coord: nil, weather: [], wind: nil)))
        let successExpectation = XCTestExpectation(description: "Success")
        useCase.getWeatherDetailsForCity(cityName: "Pune") { result in
            if case .success = result {
                successExpectation.fulfill()
            }
        }
        wait(for: [successExpectation], timeout: 2)
    }
}


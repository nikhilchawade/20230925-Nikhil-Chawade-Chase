//
//  WeatherModelTests.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 26/09/23.
//

import XCTest
@testable import _0230925_Nikhil_Chawade_Chase

final class WeatherModelTests: XCTestCase {

    func testWeatherModelNameEquality() throws {
        let weatherModel = getWeatherModel()
        let anotherWeatherModel = getWeatherModel()
        XCTAssertEqual(weatherModel.description, anotherWeatherModel.description)
    }
    
    func testWeatherModelDescriptionEquality() throws {
        let weatherModel = getWeatherModel()
        let anotherWeatherModel = getWeatherModel()
        XCTAssertEqual(weatherModel.icon, anotherWeatherModel.icon)
    }
    
    func testWeatherModelIconEquality() throws {
        let weatherModel = getWeatherModel()
        let anotherWeatherModel = getWeatherModel()
        XCTAssertEqual(weatherModel.id, anotherWeatherModel.id)
    }
    
    private func getWeatherModel() -> WeatherModel {
        return WeatherModel(description: "description", icon: "", id: 1, main: "main")
    }

}

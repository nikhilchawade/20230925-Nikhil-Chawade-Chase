//
//  CoordinatesModelTests.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 26/09/23.
//

import XCTest
@testable import _0230925_Nikhil_Chawade_Chase

final class CoordinatesModelTests: XCTestCase {

    func testWeatherModelNameEquality() throws {
        let coordinatesModel = getCoordinatesModel()
        let anotherCoordinatesModel = getCoordinatesModel()
        XCTAssertEqual(coordinatesModel.lat, anotherCoordinatesModel.lat)
    }
    
    func testWeatherModelDescriptionEquality() throws {
        let coordinatesModel = getCoordinatesModel()
        let anotherCoordinatesModel = getCoordinatesModel()
        XCTAssertEqual(coordinatesModel.lon, anotherCoordinatesModel.lon)
    }
    
    private func getCoordinatesModel() -> CoordinatesModel {
        return CoordinatesModel(lon: 74, lat: 23)
    }

}

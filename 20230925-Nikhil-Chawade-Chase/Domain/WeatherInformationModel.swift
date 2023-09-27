//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation

struct WeatherInformationModel: Codable {
    let id: Int?
    let main: WeatherDetailModel?
    let name: String?
    let coord: CoordinatesModel?
    let weather: [WeatherModel]?
    let wind: WindModel?
}

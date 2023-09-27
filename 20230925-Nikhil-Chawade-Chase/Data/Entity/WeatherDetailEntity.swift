import Foundation

//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

struct WeatherDetailEntity: Codable {
    let feelsLike: Float?
    let humidity: Int?
    let pressure: Int?
    let temp: Float?
    let temp_max: Float?
    let temp_min: Float?

    func toDomain() throws -> WeatherDetailModel {
        return WeatherDetailModel(feelsLike: feelsLike,
                                  humidity: humidity,
                                  pressure: pressure,
                                  temp: temp,
                                  temp_max: temp_max,
                                  temp_min: temp_min)
    }
}

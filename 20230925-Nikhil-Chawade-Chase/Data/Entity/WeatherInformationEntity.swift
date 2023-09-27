//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation

struct WeatherInformationEntity: Decodable {
    let id: Int?
    let main: WeatherDetailEntity?
    let name: String?
    let coord: CoordinatesEntity?
    let weather: [WeatherEntity]?
    let wind: WindEntity?

    func toDomain() throws -> WeatherInformationModel {
        guard let id = id else {
            throw DecodingError.valueNotFound(Int.self, DecodingError.Context(codingPath: [], debugDescription: "Failed to map id"))
        }
        let weatherModels = weather?.compactMap({ entity in
            return try? entity.toDomain()
        }) ?? []
        return WeatherInformationModel(id: id,
                                       main: try main?.toDomain(),
                                       name: name,
                                       coord: try coord?.toDomain(),
                                       weather: weatherModels,
                                       wind: try? wind?.toDomain())
    }
}

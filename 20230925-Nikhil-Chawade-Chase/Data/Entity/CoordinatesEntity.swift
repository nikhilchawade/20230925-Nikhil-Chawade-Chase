//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation

struct CoordinatesEntity: Codable {
    let lon: Double?
    let lat: Double?

    func toDomain() throws -> CoordinatesModel {
        return CoordinatesModel(lon: lon, lat: lat)
    }
}

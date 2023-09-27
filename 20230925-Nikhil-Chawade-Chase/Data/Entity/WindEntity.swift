//
//  NCImageCache.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation

struct WindEntity: Codable {
    let deg: Float?
    let speed: Float?

    func toDomain() throws -> WindModel {
        return WindModel(deg: deg, speed: speed)
    }
}

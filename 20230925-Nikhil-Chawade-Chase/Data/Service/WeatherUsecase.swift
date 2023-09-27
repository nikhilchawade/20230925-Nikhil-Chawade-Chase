//
//  WeatherUsecase.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 25/09/23.
//

import Foundation
import UIKit

protocol WeatherUsecaseProtocol {
    func getWeatherDetailsForCity(cityName: String, completion: @escaping(Result<WeatherInformationModel?, Error>) -> Void)
    func getIcon(url: URL, completion: @escaping (Result<Data?, Error>) -> Void)
}

class WeatherUsecase: WeatherUsecaseProtocol {
    private let provider: APIProviderProtocol

    init(provider: APIProviderProtocol) {
        self.provider = provider
    }

    func getWeatherDetailsForCity(cityName: String, completion: @escaping(Result<WeatherInformationModel?, Error>) -> Void) {
        
        provider.fetchDataForCity(cityName: cityName) { fetchedItems, error in
            if let fetchedItems = fetchedItems {
                completion(.success(fetchedItems))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getIcon(url: URL, completion: @escaping (Result<Data?, Error>) -> Void) {
        provider.getIcon(url: url) { data, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}

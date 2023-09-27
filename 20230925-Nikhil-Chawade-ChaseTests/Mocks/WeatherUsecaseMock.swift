//
//  WeatherUsecaseMock.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 26/09/23.

import UIKit
@testable import _0230925_Nikhil_Chawade_Chase

final class WeatherUsecaseMock: WeatherUsecaseProtocol {
    var mockResponse: WeatherInformationModel!

    init(mockResponse: WeatherInformationModel) {
        self.mockResponse = mockResponse
    }
    
    func getWeatherDetailsForCity(cityName: String, completion: @escaping(Result<WeatherInformationModel?, Error>) -> Void) {
        
        guard let mockResponse = mockResponse else {
            fatalError("Mock response required")
        }
        completion(.success(mockResponse))
    }
    
    func getIcon(icon: String, completion: @escaping (Result<UIImage, Error>) -> Void) async {
    }

    func getIcon(url: URL, completion: @escaping (Result<Data?, Error>) -> Void) {
    }
}

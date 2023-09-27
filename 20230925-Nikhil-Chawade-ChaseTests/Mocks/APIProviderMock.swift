//
//  APIProviderMock.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation
@testable import _0230925_Nikhil_Chawade_Chase
import UIKit

typealias WeatherResponse = Result<WeatherInformationModel, Error>

final class APIProviderMock: APIProviderProtocol {
    private var mockResponse: WeatherInformationModel!

    init(mockResponse: WeatherInformationModel) {
        self.mockResponse = mockResponse
    }
    
    func fetchDataForCity(cityName: String, completion: @escaping (_0230925_Nikhil_Chawade_Chase.WeatherInformationModel?, Error?) -> Void) {
        guard let mockResponse = mockResponse else {
            fatalError("mock needed")
        }
        completion(mockResponse, nil)
    }
    
    func fetchImage(iconImage: String, completion: @escaping (Result<UIImage, Error>) -> Void) async {
    }
    
    func getIcon(url: URL, completion: @escaping (Data?, Error?) -> Void) {
    }
}

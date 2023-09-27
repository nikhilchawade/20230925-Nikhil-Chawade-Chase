//
//  APIProvider.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 25/09/23.
//

import Foundation
import UIKit

protocol APIProviderProtocol {
    func fetchDataForCity(cityName: String, completion: @escaping (WeatherInformationModel?, Error?) -> Void)
    func getIcon(url: URL, completion: @escaping (Data?, Error?) -> Void)
}

class APIProvider: APIProviderProtocol {
    func fetchDataForCity(cityName: String, completion: @escaping (WeatherInformationModel?, Error?) -> Void) {
        Task {
            do {
                guard let url = URL(string: AppConstants().getCityDetailsURL(cityName: cityName)) else { return }
                let (data, _) = try await URLSession.shared.data(from: url)
                print(String(data: data, encoding: .utf8)!)
                let decodedData = try? JSONDecoder().decode(WeatherInformationModel?.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func getIcon(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.downloadTask(with: url) { localUrl, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let localUrl = localUrl else {
                completion(nil, error)
                return
            }
            
            do {
                let data = try Data(contentsOf: localUrl)
                completion(data, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}

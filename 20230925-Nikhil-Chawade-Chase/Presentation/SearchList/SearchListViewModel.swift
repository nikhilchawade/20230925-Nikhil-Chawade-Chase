//
//  BaseViewController.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import Foundation
import UIKit

struct SearchUIModel {
    let name: String
    let imageURL: URL?
    let image: UIImage?
    var temp: String
    var tempMin: String
    var tempMax: String
    var wind: String
}

enum SearchViewState {
    case clear
    case loading
    case render(SearchUIModel)
    case error
}

protocol BaseViewModel {}

protocol SearchViewModelContract: AnyObject {
    var view: SearchViewContract? { get set }
    var flowCoordinator: WeatherFlowCoordinatorContract? { get set }
    var imageUrl: URL? { get set }
    
    func viewLoaded()
    func searchText(text: String?)
}

final class SearchViewModel: SearchViewModelContract {
    weak var view: SearchViewContract?
    var flowCoordinator: WeatherFlowCoordinatorContract?
    private let limitValue = 20
    private var offsetValue = 0
    private var hasMoreData = true
    private var isDataLoading = false
    private var viewState: SearchViewState = .clear {
        didSet {
            view?.changeState(state: viewState)
        }
    }
    
    var searchData: WeatherInformationModel?
    @Published var imageCache: NCImageCache?
    
    var imageUrl: URL? {
        didSet {
            self.fetchWeatherIcon()
        }
    }
    
    var useCase: WeatherUsecaseProtocol = WeatherUsecase(provider: APIProvider())
    
    func viewLoaded() {
        // Default method
    }
    
    /// This method is used to get city information regarding
    func searchText(text: String?) {
        if let searchText = text {
            UserDefaults.standard.setValue(searchText, forKey: "lastCity")
            useCase.getWeatherDetailsForCity(cityName: searchText) { [self] result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.searchData = model
                        self.viewState = .render(self.renderViewModel(model: model, image: nil))
                    }
                case .failure:
                    self.viewState = .error
                }
            }
        }
    }
    /// Render view state
    func renderViewModel(model: WeatherInformationModel?, image: UIImage?) -> SearchUIModel {
        let temp = "Temperature -> " + String(model?.main?.temp ?? 0.0)
        let tempMin = "Minimum Temp -> " + String(model?.main?.temp_min ?? 0.0)
        let tempMax = "Maximum Temp -> " + String(model?.main?.temp_max ?? 0.0)
        let wind = "Wind -> " + String(model?.wind?.speed ?? 0.0)
        let url = URL(string: AppConstants().getWeatherImageURL(iconImage: model?.weather?.first?.icon ?? ""))
        return SearchUIModel(name: model?.name ?? "",
                             imageURL: url,
                             image: image,
                             temp: temp,
                             tempMin: tempMin,
                             tempMax: tempMax,
                             wind: wind)
    }
    
    /// Fetch weather condition icon.
    private func fetchWeatherIcon() {
        guard let url = imageUrl else { return }
        useCase.getIcon(url: url) { result  in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let weatherImage = self.image(data: data) {
                        self.imageCache?.setImage(weatherImage, forKey: url.absoluteString)
                        self.viewState = .render(self.renderViewModel(model: self.searchData, image: weatherImage))
                    }
                }
            case .failure:
                self.viewState = .error
            }
        }
    }
    
    private func image(data: Data?) -> UIImage? {
        if let data = data {
            return UIImage(data: data)
        }
        return UIImage(systemName: "")
    }
}

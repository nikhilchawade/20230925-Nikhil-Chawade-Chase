//
//  BaseViewController.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 26/09/23.
//

import UIKit
import CoreLocation

protocol SearchViewContract: AnyObject {
    var viewModel: SearchViewModelContract! { get set }

    func changeState(state: SearchViewState)
}

class SearchViewController: BaseViewController, StoryboardInstantiable {
    static var storyboardName = "SearchViewController"

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchCityTextfield: UITextField!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet private weak var temp: UILabel!
    @IBOutlet private weak var minTemp: UILabel!
    @IBOutlet private weak var maxTemp: UILabel!
    @IBOutlet private weak var wind: UILabel!
    var viewModel: SearchViewModelContract!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel.viewLoaded()
        locationManager.requestAlwaysAuthorization()
        handleAutoWeather()
    }

    private func configureView() {
        title = "Weather Details"
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        searchCityTextfield.endEditing(true)
        viewModel.searchText(text: searchCityTextfield.text ?? "")
    }

    /// Handle default weather showing conditions
    private func handleAutoWeather() {
        switch locationManager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    func renderData(model: SearchUIModel) {
        mainStackView.isHidden = false
        cityName.text = model.name
        temp.text = model.temp
        minTemp.text = model.tempMin
        maxTemp.text = model.tempMax
        wind.text = model.wind
        self.viewModel.imageUrl = model.imageURL
        imageView.image = model.image
    }
}

extension SearchViewController: SearchViewContract {
    func changeState(state: SearchViewState) {
        switch state {
        case .clear:
            break
        case .loading:
            showLoader()
        case let .render(model):
            hideLoader()
            renderData(model: model)
        case .error:
            hideLoader()
            showErrorMessage()
        }
    }
}

//
//  BaseViewController.swift
//  20230925-Nikhil-Chawade-Chase
//
//  Created by Nikhil Chawade on 25/09/23.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        activityIndicator.color = .blue
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .white
        }
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.isHidden = true
    }

    func showLoader() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }

    func hideLoader() {
        activityIndicator.stopAnimating()
    }

    func showErrorMessage() {
        let message = "Error"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        let duration: Double = 2

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
}

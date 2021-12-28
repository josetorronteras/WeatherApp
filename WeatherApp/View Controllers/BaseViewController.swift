//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 27/12/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Variables
    lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .blue
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
        return activityIndicator
    }()
    
    var spinnerView: UIView?
    
    // MARK: - Methods
    func showLoadingIndicator() {
        self.spinnerView = UIView.init(frame: self.view.bounds)
        DispatchQueue.main.async {
            if let spinnerView = self.spinnerView {
                spinnerView.addSubview(self.spinner)
                self.view.addSubview(spinnerView)
            }
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinnerView?.removeFromSuperview()
            self.spinnerView = nil
        }
    }
}

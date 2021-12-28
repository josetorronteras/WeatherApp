//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 27/12/21.
//

import UIKit
import Lottie

class CityWeatherInfoViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet weak var mainWeatherLabel: UILabel!
    @IBOutlet weak var temperatureWeatherLabel: UILabel!
    @IBOutlet weak var descriptionWeatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Initial Properties
    let viewModel = CityWeatherInfoViewModel()
    
    // MARK: - Variables
    var animationView: AnimationView?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(CityWeatherInfoCell.nib,
                                     forCellWithReuseIdentifier: CityWeatherInfoCell.reuseIdentifier)
        
        self.listenerViewModel()
        self.viewModel.fetchWeatherDataByGeoLocation()
    }
    
    // MARK: - Methods
    private func listenerViewModel() {
        self.viewModel.updateViewState = { [weak self] state in
            guard let strongSelf = self else { return }
            switch state {
            case .initial:
                print("initial")
                strongSelf.hideLoadingIndicator()
                strongSelf.baseView.isHidden = false
            case .loading:
                print("loading")
                strongSelf.showLoadingIndicator()
                strongSelf.animationView?.removeFromSuperview()
                strongSelf.baseView.isHidden = true
            case .error:
                print("error")
                strongSelf.hideLoadingIndicator()
                strongSelf.baseView.isHidden = false
            }
        }
        
        self.viewModel.updateViewWithData = { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.cityNameLabel.text = data.cityName
            strongSelf.mainWeatherLabel.text = data.infoWeather.first?.main
            strongSelf.temperatureWeatherLabel.text = String(data.mainWeather.temperature) + "º C"
            strongSelf.descriptionWeatherLabel.text = data.infoWeather.first?.description
            strongSelf.humidityLabel.text = String(data.mainWeather.humidity) + " %"
            strongSelf.windLabel.text = String(data.windWeather.speed) + " m/s"
            
            strongSelf.animationView = AnimationView(name: data.infoWeather.first?.type.lottieName ?? "")
            strongSelf.animationView?.frame = strongSelf.lottieView.bounds
            strongSelf.animationView?.loopMode = .loop
            strongSelf.animationView?.animationSpeed = 0.5
            if let animationView = strongSelf.animationView {
                strongSelf.lottieView.addSubview(animationView)
                animationView.play()
            }
            strongSelf.collectionView.reloadData()
        }
    }
    
    // MARK: - Actions
    @IBAction func refreshButtonAction(_ sender: Any) {
        self.viewModel.fetchWeatherDataByGeoLocation()
    }
}

// MARK: - UICollectionViewDelegate
extension CityWeatherInfoViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }
}

// MARK: - UICollectionViewDataSource
extension CityWeatherInfoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityWeatherInfoCell.reuseIdentifier,
                                                      for: indexPath) as! CityWeatherInfoCell
        cell.data = self.viewModel.dataSource[indexPath.row]
        return cell
    }
}

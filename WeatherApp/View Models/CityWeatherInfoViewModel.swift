//
//  CityWeatherInfoViewModel.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 27/12/21.
//

import Foundation

enum CityWeatherInfoViewState {
    case initial
    case loading
    case error
}

class CityWeatherInfoViewModel {
    
    // MARK: - Initial Properties
    var service: WeatherAPIServiceProtocol
    
    // MARK: - Init
    init(service: WeatherAPIServiceProtocol = WeatherAPIService()) {
        self.service = service
    }
    
    // MARK: - Variables
    var state: CityWeatherInfoViewState = .initial {
        didSet {
            self.updateViewState?(self.state)
        }
    }
    
    var dataSource: [CityWeatherInfoCellData] = []
    
    // MARK: - Observables
    var updateViewState: ((CityWeatherInfoViewState) -> ())?
    var updateViewWithData: ((WeatherConditionModel) -> ())?
    
    // MARK: - Methods
    func fetchWeatherDataByGeoLocation() {
        let latitude = Float.random(in: -90..<90)
        let longitude = Float.random(in: -180..<180)
        
        self.state = .loading
        self.service.fetchWeatherByGeographicCoordinates(latitude: latitude,
                                                         longitude: longitude,
                                                         completion: { (result) in
            switch result {
            case .success(let data):
                self.state = .initial
                self.createDataSource(data: data)
                self.updateViewWithData?(data)
                print(data)
            case .failure(let error):
                self.state = .error
                print(error)
            }
        })
    }
    
    private func createDataSource(data: WeatherConditionModel) {
        var dataSource = [CityWeatherInfoCellData]()
        dataSource.append(CityWeatherInfoCellData(title: "Max Temp",
                                                  icon: "thermometer.sun.fill",
                                                  value: String(data.mainWeather.maxTemperature) + "º C"))
        dataSource.append(CityWeatherInfoCellData(title: "Min Temp",
                                                  icon: "thermometer.snowflake",
                                                  value: String(data.mainWeather.minTemperature) + "º C"))
        dataSource.append(CityWeatherInfoCellData(title: "Pressure",
                                                  icon: "tornado",
                                                  value: String(data.mainWeather.pressure) + " Pa"))
        self.dataSource = dataSource
    }
}

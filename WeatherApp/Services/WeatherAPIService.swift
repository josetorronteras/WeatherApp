//
//  WeatherAPIService.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 27/12/21.
//

import Foundation
import Alamofire

// MARK: - TypeAlias
typealias WeatherResponseCallback = (Result<WeatherConditionModel, Error>) -> Void

// MARK: - Protocol
protocol WeatherAPIServiceProtocol {
    func fetchWeatherByGeographicCoordinates(latitude: Float, longitude: Float, completion: @escaping WeatherResponseCallback)
}

// MARK: - WeatherAPIService
final class WeatherAPIService: WeatherAPIServiceProtocol {
    
    func fetchWeatherByGeographicCoordinates(latitude: Float, longitude: Float, completion: @escaping WeatherResponseCallback) {
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=0bc9bc2a73fd9644f664cf5f5c5be8d7"
        
        print(baseURL)
        AF.request(baseURL)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { (response) in
            print(response)
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let cityWeather = try JSONDecoder().decode(WeatherConditionModel.self, from: data)
                    completion(.success(cityWeather))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

//
//  MockWeatherAPIService.swift
//  WeatherAppTests
//
//  Created by Jose Torronteras on 28/12/21.
//

import Foundation

final class MockWeatherAPIService: WeatherAPIServiceProtocol {
    
    func fetchWeatherByGeographicCoordinates(latitude: Float, longitude: Float, completion: @escaping WeatherResponseCallback) {
        do {
            guard let path = Bundle(for: type(of: self)).path(forResource: "ApiResponse", ofType: "json"),
                  let json = try? String(contentsOfFile: path, encoding: .utf8),
                  let jsonData = json.data(using: .utf8) else {
                        return
            }
            let model = try JSONDecoder().decode(WeatherConditionModel.self, from: jsonData)
            completion(.success(model))
        } catch {
            completion(.failure(error))
        }
    }
}

//
//  WeatherConditionModel.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 27/12/21.
//

import Foundation

struct WeatherConditionModel: Decodable {
    
    // MARK: - Properties
    var geoLocation: GeoLocation
    var infoWeather: [InfoWeather]
    var mainWeather: MainWeather
    var windWeather: WindWeather
    var id: Int
    var cityName: String
    var code: Int
    
    enum CodingKeys: String, CodingKey {
        case geoLocation = "coord"
        case infoWeather = "weather"
        case mainWeather = "main"
        case windWeather = "wind"
        case id = "id"
        case cityName = "name"
        case code = "cod"
    }
    
    // MARK: - Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.geoLocation = try container.decode(GeoLocation.self, forKey: .geoLocation)
        self.infoWeather = try container.decode([InfoWeather].self, forKey: .infoWeather)
        self.mainWeather = try container.decode(MainWeather.self, forKey: .mainWeather)
        self.windWeather = try container.decode(WindWeather.self, forKey: .windWeather)
        self.id = try container.decode(Int.self, forKey: .id)
        let cityName = try container.decode(String.self, forKey: .cityName)
        if cityName.isEmpty {
            self.cityName = String(geoLocation.latitude) + " / " + String(geoLocation.longitude)
        } else {
            self.cityName = cityName
        }
        self.code = try container.decode(Int.self, forKey: .code)
    }
}

struct GeoLocation: Decodable {
    
    // MARK: - Properties
    var longitude: Float
    var latitude: Float

    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
    
    // MARK: - Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.longitude = try container.decode(Float.self, forKey: .longitude)
        self.latitude = try container.decode(Float.self, forKey: .latitude)
    }
}

struct InfoWeather: Decodable {
    
    // MARK: - Properties
    var type: WeatherConditionsTypes = .unknown
    var main: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case type = "id"
        case main = "main"
        case description = "description"
    }
    
    // MARK: - Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeInt = try container.decode(Int.self, forKey: .type)
        self.type = WeatherConditionsTypes(rawValue: typeInt) ?? .unknown
        self.main = try container.decode(String.self, forKey: .main)
        self.description = try container.decode(String.self, forKey: .description)
    }
}

struct MainWeather: Decodable {
    
    // MARK: - Properties
    var temperature: Float
    var minTemperature: Float
    var maxTemperature: Float
    var pressure: Int
    var humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
    
    // MARK: - Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temperature = try container.decode(Float.self, forKey: .temperature)
        self.minTemperature = try container.decode(Float.self, forKey: .minTemperature)
        self.maxTemperature = try container.decode(Float.self, forKey: .maxTemperature)
        self.pressure = try container.decode(Int.self, forKey: .pressure)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
    }
}

struct WindWeather: Decodable {
    
    // MARK: - Properties
    var speed: Float
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
    }
    
    // MARK: - Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decode(Float.self, forKey: .speed)
    }
}

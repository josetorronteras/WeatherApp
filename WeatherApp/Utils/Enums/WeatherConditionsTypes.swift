//
//  WeatherConditionsTypes.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 27/12/21.
//

import Foundation
import UIKit

enum WeatherConditionsTypes: Int {
    case unknown = 0
    
    /// Group 2xx: Thunderstorm
    case ligthRainThunderstorm = 200
    case rainThunderstorm = 201
    case heavyRainThunderstorm = 202
    case ligthThunderstorm = 210
    case thunderstorm = 211
    case heavyThunderstorm = 212
    case raggedThunderstorm = 221
    case lightDrizzleThunderstorm = 230
    case drizzleThunderstorm = 231
    case heavyDrizzleThunderstorm = 232
    
    /// Group 3xx: Drizzle
    case lightIntensityDrizzle = 300
    case drizzle = 301
    case heavyIntensityDrizzle = 302
    case lightIntensityRainDrizzle = 310
    case drizzleRainDrizzle = 311
    case heavyIntensityRainDrizzle = 312
    case showerRainDrizzle = 313
    case heavyShowerRainDrizzle = 314
    case showerDrizzle = 321
    
    /// Group 5xx: Rain
    case lightRain = 500
    case moderateRain = 501
    case heavyIntensityRain = 502
    case veryHeavyRain = 503
    case extremeRain = 504
    case freezingRain = 511
    case lightIntensityRain = 520
    case showerRain = 521
    case heavyIntensityShowerRain = 522
    case raggedShowerRain = 531
    
    /// Group 6xx: Snow
    case lightSnow = 600
    case snow = 601
    case heavySnow = 602
    case sleetSnow = 611
    case lightShowerSleetSnow = 612
    case ShowerSleetSnow = 613
    case LightRainSnow = 615
    case RainSnow = 616
    case LightShowerSnow = 620
    case ShowerSnow = 621
    case HeavyShowerSnow = 622
    
    /// Group 7xx: Atmosphere
    case mist = 701
    case smoke = 711
    case haze = 721
    case dustSand = 731
    case fog = 741
    case sand = 751
    case dust = 761
    case ash = 762
    case squall = 771
    case tornado = 781
    
    /// Group 800: Clear
    case clear = 800
    
    /// Group 80x: Clouds
    case fewClouds = 801
    case scatteredClouds = 802
    case brokenClouds = 803
    case overcastClouds = 804
    
    var lottieName: String {
        switch self {
        case .unknown: return "unknown"
        case .thunderstorm, .ligthRainThunderstorm, .rainThunderstorm, .heavyRainThunderstorm, .ligthThunderstorm, .heavyThunderstorm, .raggedThunderstorm, .lightDrizzleThunderstorm, .drizzleThunderstorm, .heavyDrizzleThunderstorm: return "thunderstorm"
        case .lightIntensityDrizzle, .drizzle, .heavyIntensityDrizzle, .lightIntensityRainDrizzle, .drizzleRainDrizzle, .heavyIntensityRainDrizzle, .showerRainDrizzle, .heavyShowerRainDrizzle, .showerDrizzle: return "drizzle"
        case .lightRain, .moderateRain, .heavyIntensityRain, .veryHeavyRain, .extremeRain, .freezingRain, .lightIntensityRain, .showerRain, .heavyIntensityShowerRain, .raggedShowerRain: return "rain"
        case .lightSnow, .snow, .heavySnow, .sleetSnow, .lightShowerSleetSnow, .ShowerSleetSnow, .LightRainSnow, .RainSnow, .LightShowerSnow, .ShowerSnow, .HeavyShowerSnow: return "snow"
        case .mist, .smoke, .haze, .dustSand, .fog, .sand, .dust, .ash, .squall, .tornado: return "mist"
        case .clear: return "clear"
        case .fewClouds, .scatteredClouds, .brokenClouds, .overcastClouds: return "cloud"
        }
    }
}

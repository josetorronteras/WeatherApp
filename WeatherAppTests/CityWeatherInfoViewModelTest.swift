//
//  CityWeatherInfoViewModelTest.swift
//  WeatherAppTests
//
//  Created by Jose Torronteras on 28/12/21.
//

import XCTest

class CityWeatherInfoViewModelTest: XCTestCase {

    var mockCityWeatherInfoViewModel: CityWeatherInfoViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mockCityWeatherInfoViewModel = CityWeatherInfoViewModel(service: MockWeatherAPIService())
        self.mockCityWeatherInfoViewModel.fetchWeatherDataByGeoLocation()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel() throws {
        XCTAssertEqual(self.mockCityWeatherInfoViewModel.dataSource.count, 3)
        XCTAssertEqual(self.mockCityWeatherInfoViewModel.state, CityWeatherInfoViewState.initial)
    }
}

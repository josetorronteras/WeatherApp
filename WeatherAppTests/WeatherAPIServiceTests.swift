//
//  WeatherAPIServiceTests.swift
//  WeatherAppTests
//
//  Created by Jose Torronteras on 28/12/21.
//

import XCTest

class WeatherAPIServiceTests: XCTestCase {

    var mockWeatherAPIService: MockWeatherAPIService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mockWeatherAPIService = MockWeatherAPIService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchApi() throws {
        self.mockWeatherAPIService.fetchWeatherByGeographicCoordinates(latitude: 1.0,
                                                                       longitude: 1.0) { result in
            switch result {
            case .success(_):
                XCTAssert(true)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}

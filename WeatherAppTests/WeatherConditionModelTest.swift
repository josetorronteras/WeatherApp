//
//  WeatherConditionModelTest.swift
//  WeatherAppTests
//
//  Created by Jose Torronteras on 28/12/21.
//

import XCTest

class WeatherConditionModelTest: XCTestCase {

    var model: WeatherConditionModel?
    
    override func setUpWithError() throws {
        do {
            guard let path = Bundle(for: type(of: self)).path(forResource: "ApiResponse", ofType: "json"),
                  let json = try? String(contentsOfFile: path, encoding: .utf8),
                  let jsonData = json.data(using: .utf8) else {
                        XCTFail("Error JSON File")
                        return
            }
            self.model = try JSONDecoder().decode(WeatherConditionModel.self, from: jsonData)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelFields() throws {
        XCTAssertEqual(self.model?.cityName, "Point Lay")
        XCTAssertEqual(self.model?.id, 5871778)
        XCTAssertEqual(self.model?.mainWeather.temperature, -30.29)
        XCTAssertEqual(self.model?.mainWeather.humidity, 95)
        XCTAssertEqual(self.model?.windWeather.speed, 7.8)
        XCTAssertEqual(self.model?.geoLocation.longitude, -166.2422)
    }
}

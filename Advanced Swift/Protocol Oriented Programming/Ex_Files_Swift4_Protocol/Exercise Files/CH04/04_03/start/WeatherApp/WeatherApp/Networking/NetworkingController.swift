//
//  NetworkingController.swift
//  WeatherApp
//
//  Created by Richie on 9/24/18.
//  Copyright © 2018 Nyisztor, Karoly. All rights reserved.
//

import Foundation

//A closure that is passed as an argument or function is non-escaping by default.
// Non-escaping means that the closure is invoked before the function retunrs.
public protocol NetworkController {
  func fetchCurrentWeatherData(city: String, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void) -> WeatherData?
}

public struct WeatherData {
  var temperature: Float
  var condition: String
  var unit: TemperatureUnit
}

public enum TemperatureUnit: String {
  case scientific = "sscientific"
  case metric = "metric"
  case imperial = "imperial"
}

//MARK: - Error 
public enum NetworkControllerError: Error {
  case invalidURL(String)
  case invalidPayload(URL)
  case forwarded(Error)
}

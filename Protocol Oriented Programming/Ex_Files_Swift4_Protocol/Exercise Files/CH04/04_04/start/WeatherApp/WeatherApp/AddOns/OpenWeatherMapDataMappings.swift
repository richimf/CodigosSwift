//
//  OpenWeatherMapDataMappings.swift
//  WeatherApp
//
//  Created by Nyisztor, Karoly on 10/26/17.
//  Copyright © 2017 Nyisztor, Karoly. All rights reserved.
//

import Foundation

struct OpenMapWeatherData: Codable {
    var weather: [OpenMapWeatherWeather]
    var main: OpenMapWeatherMain
}

struct OpenMapWeatherWeather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct OpenMapWeatherMain: Codable {
    var temp: Float
}

//
//  ApixuDataMappings.swift
//  WeatherApp
//
//  Created by Nyisztor, Karoly on 10/26/17.
//  Copyright © 2017 Nyisztor, Karoly. All rights reserved.
//

import Foundation

struct ApixuWeatherContainer: Codable {
    var current: ApixuWeatherCurrent
}

struct ApixuWeatherCurrent: Codable {
    var temp_c: Float
    var temp_f: Float
    var condition: ApixuWeatherCondition
}

struct ApixuWeatherCondition: Codable {
    var text: String
    var icon: String // icon image url
}








/*
 {"location":
 {"name":"Budapest","region":"Budapest","country":"Hungary","lat":47.5,"lon":19.08,"tz_id":"Europe/Budapest","localtime_epoch":1507662896,"localtime":"2017-10-10 21:14"},
 "current":{"last_updated_epoch":1507662013,"last_updated":"2017-10-10 21:00","temp_c":13.0,"temp_f":55.4,"is_day":0,
 "condition":{"text":"Partly cloudy","icon":"//cdn.apixu.com/weather/64x64/night/116.png","code":1003},
 "wind_mph":0.0,"wind_kph":0.0,"wind_degree":238,"wind_dir":"WSW","pressure_mb":1020.0,"pressure_in":30.6,"precip_mm":0.0,"precip_in":0.0,"humidity":72,"cloud":75,"feelslike_c":13.0,"feelslike_f":55.4,"vis_km":10.0,"vis_miles":6.0
 }
 }
 */
/*
 {
 "location": {
 "name": "Dunakeszi",
 "region": "Pest",
 "country": "Hungary",
 "lat": 47.63,
 "lon": 19.13,
 "tz_id": "Europe/Budapest",
 "localtime_epoch": 1507657054,
 "localtime": "2017-10-10 19:37"
 },
 "current": {
 "last_updated_epoch": 1507656608,
 "last_updated": "2017-10-10 19:30",
 "temp_c": 14.0,
 "temp_f": 57.2,
 "is_day": 0,
 
 "condition": {
 "text": "Clear",
 "icon": "//cdn.apixu.com/weather/64x64/night/113.png",
 "code": 1000
 },
 "wind_mph": 4.3,
 "wind_kph": 6.8,
 "wind_degree": 160,
 "wind_dir": "SSE",
 "pressure_mb": 1020.0,
 "pressure_in": 30.6,
 "precip_mm": 0.0,
 "precip_in": 0.0,
 "humidity": 67,
 "cloud": 0,
 "feelslike_c": 13.9,
 "feelslike_f": 57.0,
 "vis_km": 10.0,
 "vis_miles": 6.0
 }
 }
 */

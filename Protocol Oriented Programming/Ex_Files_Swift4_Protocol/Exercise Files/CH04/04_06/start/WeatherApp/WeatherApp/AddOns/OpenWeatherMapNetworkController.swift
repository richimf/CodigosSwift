import Foundation

final class OpenWeatherMapNetworkController {

    /*
     private func decode(jsonData: Data, endpointURL: URL, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void) {
     let decoder = JSONDecoder()
     do {
     let weatherInfo = try decoder.decode(OpenMapWeatherData.self, from: jsonData)
     
     let weatherData = WeatherData(temperature: weatherInfo.main.temp, condition: (weatherInfo.weather.first?.main ?? "?"), unit: self.tempUnit)
     completionHandler(weatherData, nil)
     } catch let error {
     completionHandler(nil, NetworkControllerError.forwarded(error))
     }
     }
     */
}


private enum API {
    static let key = "ADD_YOUR_API_KEY_HERE"
}

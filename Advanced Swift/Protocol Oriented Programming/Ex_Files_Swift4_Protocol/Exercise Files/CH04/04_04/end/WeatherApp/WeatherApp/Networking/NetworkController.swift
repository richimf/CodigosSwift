import Foundation

public protocol NetworkController {
    func fetchCurrentWeatherData(city: String, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void) -> WeatherData?
}

public struct WeatherData {
    var temperature: Float
    var condition: String
    var unit: TemperatureUnit
}

public enum TemperatureUnit: String {
    case scientific = "scientific"
    case metric = "metric"
    case imperial = "imperial"
}

public enum NetworkControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

import Foundation

public protocol NetworkController {
    func fetchCurrentWeatherData(city: String) -> WeatherData?
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

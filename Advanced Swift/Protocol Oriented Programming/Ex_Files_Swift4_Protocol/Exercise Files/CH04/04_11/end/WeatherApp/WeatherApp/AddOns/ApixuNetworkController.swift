import Foundation

private enum API {
    static let key = "e69da143f1244c69972173649171010"
}

final class ApixuNetworkController: NetworkController {
    public var tempUnit: TemperatureUnit = .imperial
    
    let backupController: NetworkController?
    
    public init(backupController: NetworkController? = nil) {
        self.backupController = backupController
    }
    
    func fetchCurrentWeatherData(city: String, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let endpoint = "http://api.apixu.com/v1/current.json?key=\(API.key)&q=\(city)"
                
        let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        guard let endpointURL = URL(string: safeURLString) else {
            completionHandler(nil, NetworkControllerError.invalidURL(safeURLString))
            return
        }
        
        let dataTask = session.dataTask(with: endpointURL, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {                
                completionHandler(nil, NetworkControllerError.forwarded(error!))
                return
            }
            guard let responseData = data else {
                completionHandler(nil, NetworkControllerError.invalidPayload(endpointURL))
                return
            }
            
            // decode json
            self.decode(jsonData: responseData, endpointURL: endpointURL, completionHandler: completionHandler)
        })
        
        dataTask.resume()
    }
    
    private func decode(jsonData: Data, endpointURL: URL, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void) {
        let decoder = JSONDecoder()
        do {
            let weatherContainer = try decoder.decode(ApixuWeatherContainer.self, from: jsonData)
            let weatherInfo = weatherContainer.current
            
            var temp: Float
            
            switch self.tempUnit {
            case .metric:
                temp = weatherInfo.temp_c
            case .imperial:
                temp = weatherInfo.temp_f
            case .scientific:
                temp = weatherInfo.temp_c + 273.15
            }
            
            let weatherData = WeatherData(temperature: temp, condition: weatherInfo.condition.text, unit: self.tempUnit)
            completionHandler(weatherData, nil)
        } catch let error {
            completionHandler(nil, NetworkControllerError.forwarded(error))
        }
    }
}

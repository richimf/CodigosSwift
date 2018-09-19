import UIKit

class ViewController: UIViewController {
    private lazy var controller = OpenWeatherMapNetworkController()
    
    @IBOutlet weak var weatherLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        guard let cityName = textField.text,
            cityName.isEmpty == false else {
                print("Enter a city name")
                return true
        }
        
        controller.fetchCurrentWeatherData(city: cityName) { (weatherData, error) in
            if let data = weatherData {
                let displayText = "Weather in \(cityName): \(data.condition), \(data.temperature) \(data.unit.rawValue)"
                
                self.weatherLabel.text = displayText
            } else {
                self.weatherLabel.text = "There's no weather at this location! :("
            }
        }
        
        return true
    }
}











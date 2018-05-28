/// Copyright (c) 2017 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

final class ViewController: UIViewController {
  @IBOutlet private var tvSlider: UISlider!
  @IBOutlet private var radioSlider: UISlider!
  @IBOutlet private var newspaperSlider: UISlider!
  @IBOutlet private var tvLabel: UILabel!
  @IBOutlet private var radioLabel: UILabel!
  @IBOutlet private var newspaperLabel: UILabel!
  @IBOutlet private var salesLabel: UILabel!
  private let numberFormatter = NumberFormatter()
  
  //ML Model
  //Crearemos una usando un Modelo de Regresión lineal para predecir ganancias por publicidad
  private let advertising = Advertising()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 1
    
    sliderValueChanged()
  }
  
  @IBAction func sliderValueChanged(_ sender: UISlider? = nil) {
    let tv = Double(tvSlider.value)
    let radio = Double(radioSlider.value)
    let newspaper = Double(newspaperSlider.value)

    //ML Model
    let input = AdvertisingInput(tv: tv, radio: radio, newspaper: newspaper)
    guard let output = try? advertising.prediction(input: input) else {
      return
    }
    let sales = output.sales
    
    tvLabel.text = numberFormatter.string(from: tv as NSNumber)
    radioLabel.text = numberFormatter.string(from: radio as NSNumber)
    newspaperLabel.text = numberFormatter.string(from: newspaper as NSNumber)
    salesLabel.text = numberFormatter.string(from: sales as NSNumber)
  }
}

/*

 Referencia:
 https://www.raywenderlich.com/156036/uiappearance-tutorial-getting-started

*/


import UIKit
/*
 Let’s see what this code does:
 Defines three types of themes – default, dark and graphical
 Defines a constant to help you access the selected theme
 Defines a read-only computed type property for the selected theme. 
 It uses UserDefaults to persist the current theme, and returns the default theme if none were previously selected.
 */

enum Theme: Int {
  //1, definimos los casos, habra un default y dos valores mas, de tipo entero
  case `default`, dark, graphical
  
  //2
  private enum Keys {
    static let selectedTheme = "SelectedTheme"
  }
  
  //3
  static var current: Theme {
    let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
    return Theme(rawValue: storedTheme) ?? .default //si no hay valor guardado en defaults, usamos el de la enum .defult
  }
  
  //We can get value of current color, like this: Theme.current.mainColor
  var mainColor: UIColor {
    switch self {
    case .default:
      return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    case .dark:
      return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    case .graphical:
      return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
    }
  }
  
  var barStyle: UIBarStyle {
    switch self {
    case .default, .graphical:
      return .default
    case .dark:
      return .black
    }
  }
  
  var navigationBackgroundImage: UIImage? {
    return self == .graphical ? UIImage(named: "navBackground") : nil
  }
  
  func apply() {
    //1
    UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    UserDefaults.standard.synchronize()
    
    //2
    UIApplication.shared.delegate?.window??.tintColor = mainColor
    
    //3 set bar style
    UINavigationBar.appearance().barStyle = barStyle
    UINavigationBar.appearance().setBackgroundImage(navigationBackgroundImage, for: .default)
    
    //4 Customize navigation bar back indicator
    //Here you’re simply setting the image and transition mask image to be used as the back indicator.
    UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
    
    //5 Customize Tab Bar
    UITabBar.appearance().barStyle = barStyle
    UITabBar.appearance().backgroundImage = tabBarBackgroundImage
    
    let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.withRenderingMode(.alwaysTemplate)
    let tabResizableIndicator = tabIndicator?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 2.0))
    UITabBar.appearance().selectionIndicatorImage = tabResizableIndicator
    
    //6 Segmented control
    let controlBackground = UIImage(named: "controlBackground")?
      .withRenderingMode(.alwaysTemplate)
      .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
    
    let controlSelectedBackground = UIImage(named: "controlSelectedBackground")?
      .withRenderingMode(.alwaysTemplate)
      .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
    
    UISegmentedControl.appearance().setBackgroundImage(controlBackground,
                                                       for: .normal,
                                                       barMetrics: .default)
    
    UISegmentedControl.appearance().setBackgroundImage(controlSelectedBackground,
                                                       for: .selected,
                                                       barMetrics: .default)
    
    //7 Stepper control [+|-]
    UIStepper.appearance().setBackgroundImage(controlBackground, for: .normal)
    UIStepper.appearance().setBackgroundImage(controlBackground, for: .disabled)
    UIStepper.appearance().setBackgroundImage(controlBackground, for: .highlighted)
    UIStepper.appearance().setDecrementImage(UIImage(named: "fewerPaws"), for: .normal)
    UIStepper.appearance().setIncrementImage(UIImage(named: "morePaws"), for: .normal)
    
    
    //8 Slider
    UISlider.appearance().setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
    UISlider.appearance().setMaximumTrackImage(UIImage(named: "maximumTrack")?
      .resizableImage(withCapInsets:UIEdgeInsets(top: 0, left: 0.0, bottom: 0, right: 6.0)), for: .normal)
    
    UISlider.appearance().setMinimumTrackImage(UIImage(named: "minimumTrack")?
      .withRenderingMode(.alwaysTemplate)
      .resizableImage(withCapInsets:UIEdgeInsets(top: 0, left: 6.0, bottom: 0, right: 0)), for: .normal)
    
    //9 Switch
    UISwitch.appearance().onTintColor = mainColor.withAlphaComponent(0.3)
    UISwitch.appearance().thumbTintColor = mainColor
    
  }
  
  //Customizing the Tab Bar
  var tabBarBackgroundImage: UIImage? {
    return self == .graphical ? UIImage(named: "tabBarBackground") : nil
  }
  
}

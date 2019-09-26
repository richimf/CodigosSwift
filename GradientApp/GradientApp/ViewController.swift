//
//  ViewController.swift
//  GradientApp
//
//  Created by Richie on 6/2/19.
//  Copyright © 2019 Richie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var gradientView: GradientView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //configureGradient(colors: [UIColor.yellow.cgColor, UIColor.green.cgColor])
    configureGradient()
  }

  func configureGradient() {
    gradientView.color1 = UIColor.red
    gradientView.color2 = UIColor.blue
    UIView.transition(with: self.gradientView,
                              duration: 3.25,
                              options: UIView.AnimationOptions.transitionCrossDissolve,
                              animations: { [weak self] () -> Void in
                                self?.gradientView.color1 = UIColor.yellow
                                self?.gradientView.color2 = UIColor.green
                                //self?.view.layer.addSublayer(gradientLayer)
      }, completion: nil)
  }

  func createGradientLayer() -> CAGradientLayer {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
    self.view.layer.addSublayer(gradientLayer)
    return gradientLayer
  }

}


//
//  GradientView.swift
//  GradientApp
//
//  Created by Richie on 6/2/19.
//  Copyright © 2019 Richie. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
  
  override class var layerClass: AnyClass { return CAGradientLayer.self }
  
  private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
  
  @IBInspectable var color1: UIColor = .white { didSet { updateColors() } }
  @IBInspectable var color2: UIColor = .blue  { didSet { updateColors() } }
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    configureGradient()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureGradient()
  }
  
  private func configureGradient() {
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    updateColors()
  }
  
  private func updateColors() {
    gradientLayer.colors = [color1.cgColor, color2.cgColor]
  }
  
}

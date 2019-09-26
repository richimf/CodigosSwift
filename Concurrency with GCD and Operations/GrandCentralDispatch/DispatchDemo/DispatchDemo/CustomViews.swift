//
//  CustomViews.swift
//  DispatchDemo
//
//  Created by Richie on 9/26/19.
//  Copyright © 2019 richimf. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class MYHighLightedButton: UIButton {
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setTitle("MyTitle", for: .normal)
    setTitleColor(UIColor.green, for: .normal)
  }
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

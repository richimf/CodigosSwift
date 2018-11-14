//
//  SecondViewController.swift
//  PE
//
//  Created by Luis Arias on 11/13/18.
//  Copyright © 2018 Luis Arias. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  var animator: Animator!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .orange
    let button = makeButton()
    view.addSubview(button)
    
    let pagGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan))
    view.addGestureRecognizer(pagGesture)
  }
  func makeButton() -> UIButton {
    let button = UIButton()
    button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    button.backgroundColor = .white
    button.layer.cornerRadius = button.bounds.width/2
    button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    return button
  }
  
  @objc func didPan(_ recognizer: UIPanGestureRecognizer) {
    switch recognizer.state {
    case .began:
      dismiss(animated: true, completion: nil)
    default:
      animator.handlePan(recognizer)
    }
  }
  
  @objc func dismissVC() {
    dismiss(animated: true, completion: nil)
  }
}

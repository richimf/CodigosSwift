//
//  ViewController.swift
//  PE
//
//  Created by Luis Arias on 11/13/18.
//  Copyright © 2018 Luis Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let animator = Animator()

  override func viewDidLoad() {
    super.viewDidLoad()
    let redButton = makeButton()
    view.addSubview(redButton)
  }
  
  func makeButton() -> UIButton {
    let button = UIButton()
    button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    button.backgroundColor = .red
    button.addTarget(self, action: #selector(presentSecondVC), for: .touchUpInside)
    return button
  }

  @objc func presentSecondVC() {
    let secondViewController = SecondViewController()
    secondViewController.transitioningDelegate = self
    secondViewController.animator = animator
    present(secondViewController, animated: true, completion: nil)
  }

}

extension ViewController: UIViewControllerTransitioningDelegate {
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    animator.isPresenting = true
    return animator
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    animator.isPresenting = false
    return animator
  }
  
  func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return animator as? UIViewControllerInteractiveTransitioning
  }
}



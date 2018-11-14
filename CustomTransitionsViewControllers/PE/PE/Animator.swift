//
//  Animator.swift
//  PE
//
//  Created by Luis Arias on 11/13/18.
//  Copyright © 2018 Luis Arias. All rights reserved.
//

import UIKit

class Animator: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
  
  let animtionDuration = 1.0
  var isPresenting = false
  var dismissCompleted = false
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return animtionDuration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    if isPresenting {
      performPresentingAnimation(transitionContext)
    } else {
      performDismissingAnimtion(transitionContext)
    }
  }
  
  func performPresentingAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
    let containterView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    let toViewController = transitionContext.viewController(forKey: .to)!
    let finalFrame = transitionContext.finalFrame(for: toViewController)
    
    let backgroundView = UIView()
    backgroundView.frame = finalFrame
    backgroundView.backgroundColor = .white
    
    let button = UIView()
    button.backgroundColor = .red
    button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    
    backgroundView.addSubview(button)
    containterView.addSubview(backgroundView)
    
    UIView.animate(withDuration: animtionDuration, animations: {
      backgroundView.backgroundColor = .orange
      button.layer.cornerRadius = button.bounds.width/2
      button.backgroundColor = .white
    }) { _ in
      backgroundView.removeFromSuperview()
      containterView.addSubview(toView)
      transitionContext.completeTransition(true)
    }
  }
  
  func performDismissingAnimtion(_ transitionContext: UIViewControllerContextTransitioning) {
    let contaiterView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    let toViewController = transitionContext.viewController(forKey: .to)!
    let finalFrame = transitionContext.finalFrame(for: toViewController)
    
    let backgrounView = UIView()
    backgrounView.frame = finalFrame
    backgrounView.backgroundColor = .orange
    
    let button = UIView()
    button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    button.layer.cornerRadius = button.bounds.width/2
    button.backgroundColor = .white
    
    backgrounView.addSubview(button)
    contaiterView.addSubview(backgrounView)
    
    UIView.animate(withDuration: animtionDuration, animations: {
      backgrounView.backgroundColor = .white
      button.layer.cornerRadius = 0.0
      button.backgroundColor = .red
    }) { _ in
      backgrounView.removeFromSuperview()
      if self.dismissCompleted {
        contaiterView.addSubview(toView)
      }
      transitionContext.completeTransition(self.dismissCompleted)
    }
  }
  
  func handlePan(_ recognizer: UIPanGestureRecognizer) {
    let progress = computeProgress(recognizer)
    
    switch recognizer.state {
    case .changed:
      update(progress)
    case .cancelled, .ended:
      if progress < 0.5 {
        dismissCompleted = false
        cancel()
      } else {
        dismissCompleted = true
        finish()
      }
    default:
      break
    }
  }
  
  func computeProgress(_ recognizer: UIPanGestureRecognizer) -> CGFloat {
    let translation = recognizer.translation(in: recognizer.view!.superview!)
    let progress: CGFloat = abs(translation.x / 300.0)
    return min(max(progress, 0.01), 0.99)
  }
}

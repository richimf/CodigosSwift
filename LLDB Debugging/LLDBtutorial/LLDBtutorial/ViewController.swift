//
//  ViewController.swift
//  LLDBtutorial
//
//  Created by Ricardo Montesinos Fernandez on 1/16/19.
//  Copyright © 2019 Ricardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let result = valueof(a: 5, b: 10)
    print(result)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func valueof(a: Int, b: Int) -> Int {
    let suma = sum(a, b)
    return 50 - suma
  }

  func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
  }

}


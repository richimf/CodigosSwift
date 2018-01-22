//
//  TodayViewController.swift
//  RWTracker Extension
//
//  Created by Tim Mitra on 10/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreData

class TodayViewController: UIViewController, NCWidgetProviding {
        
  @IBOutlet weak var postTitle: UILabel!
  @IBOutlet weak var postDate: UILabel!
  
  lazy var coreDataStack = CoreDataStack()
  
  lazy var dateFormatter: NSDateFormatter = {
    let dateFmt = NSDateFormatter()
    dateFmt.dateStyle = .MediumStyle
    dateFmt.timeStyle = .ShortStyle
    return dateFmt
  }()
  
  func updateLables() {
    if let post = coreDataStack.mostRecentPost() {
      
      if let title = post.valueForKey("title") as? String {
        postTitle.text = title
        
      }
      
      if let timestamp = post.valueForKey("timestamp") as? NSDate {
        postDate.text = dateFormatter.stringFromDate(timestamp)
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    updateLables()
  }
  
  func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}


import UIKit
import NotificationCenter
import CoreData

class TodayViewController: UIViewController, NCWidgetProviding {

  @IBOutlet weak var postDate: UILabel!
  @IBOutlet weak var postTitle: UILabel!

  let defaults = NSUserDefaults(suiteName: "group.com.razeware.rwtracker")!

  lazy var coreDataStack = CoreDataStack()

  lazy var dateFormatter: NSDateFormatter = {
    let dateFmt = NSDateFormatter()
    dateFmt.dateStyle = .MediumStyle
    dateFmt.timeStyle = .ShortStyle
    return dateFmt
  }()

  func updateLabels() {
    let favoriteCategories = [
      "No Favorite",
      "Announcements",
      "Podcast Episodes",
      "Tutorials",
      "Video Tutorials"
    ]

    let favoriteCategoryIndex = defaults.integerForKey("favoriteCategory")
    let favoriteCategory = favoriteCategories[favoriteCategoryIndex]

    var post: NSManagedObject?

    if favoriteCategoryIndex > 0 {
      post = coreDataStack.mostRecentPostForCategory(favoriteCategory)
    }

    if post == nil {
      post = coreDataStack.mostRecentPost()
    }

    updateLabelFromPost(post)
  }

  func updateLabelFromPost(post: NSManagedObject?) {
    if let title = post?.valueForKey("title") as? String {
      postTitle.text = title
    }

    if let timestamp = post?.valueForKey("timestamp") as? NSDate {
      postDate.text = dateFormatter.stringFromDate(timestamp)
    }
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    updateLabels()
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

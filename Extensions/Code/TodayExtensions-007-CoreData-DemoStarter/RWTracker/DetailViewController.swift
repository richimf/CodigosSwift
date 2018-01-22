
import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var webView: UIWebView!

  @IBAction func openInBrowser(sender: AnyObject) {
    if let item: AnyObject = self.detailItem {
      if let link = item.valueForKey("link") as? String {
        if let url = NSURL(string: link) {
          UIApplication.sharedApplication().openURL(url)
        }
      }
    }
  }

  var detailItem: AnyObject? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }

  func configureView() {
    // Update the user interface for the detail item.
    if let item: AnyObject = self.detailItem {
      if let title = item.valueForKey("title") as? String {
        self.titleLabel?.text = title
      }
      if let content = item.valueForKey("content") as? String {
        self.webView?.loadHTMLString(content, baseURL: NSURL(string: "http://www.raywenderlich.com/"))
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
  }

  
}

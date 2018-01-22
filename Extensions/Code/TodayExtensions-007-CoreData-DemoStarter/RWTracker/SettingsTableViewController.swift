
import UIKit

class SettingsTableViewController: UITableViewController {
  let defaults = NSUserDefaults.standardUserDefaults()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    let currentFavorite = defaults.integerForKey("favoriteCategory")

    if indexPath.row == currentFavorite {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    defaults.setInteger(indexPath.row, forKey: "favoriteCategory")
    defaults.synchronize()
    tableView.reloadData()
  }
}

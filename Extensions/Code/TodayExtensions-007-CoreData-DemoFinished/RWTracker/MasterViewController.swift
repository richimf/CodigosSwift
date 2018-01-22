
import UIKit
import CoreData
import RWFetcher

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {
  var detailViewController: DetailViewController?
  var managedObjectContext: NSManagedObjectContext?

  let fetcher = RWFetcher()

  override func awakeFromNib() {
    super.awakeFromNib()

    if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
      self.clearsSelectionOnViewWillAppear = false
      self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
      self.splitViewController?.preferredDisplayMode = .AllVisible
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    if let split = self.splitViewController {
      let controllers = split.viewControllers
      self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }

    fetcher.delegate = self
    fetcher.managedObjectContext = managedObjectContext
    fetcher.start()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Segues

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      let indexPath = self.tableView.indexPathForSelectedRow
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath!) as! NSManagedObject
        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
        controller.detailItem = object
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
  }

  // MARK: - Table View

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return self.fetchedResultsController.sections?.count ?? 0
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
    return sectionInfo.numberOfObjects
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    self.configureCell(cell, atIndexPath: indexPath)
    return cell
  }

  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      let context = self.fetchedResultsController.managedObjectContext
      context.deleteObject(self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject)

      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        //println("Unresolved error \(error), \(error.userInfo)")
        abort()
      }
    }
  }

  lazy var dateFormatter: NSDateFormatter = {
    let dateFmt = NSDateFormatter()
    dateFmt.dateStyle = NSDateFormatterStyle.MediumStyle
    dateFmt.timeStyle = NSDateFormatterStyle.ShortStyle
    return dateFmt
    }()

  func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
    let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
    if let timestamp = object.valueForKey("timestamp") as? NSDate {
      cell.detailTextLabel?.text = dateFormatter.stringFromDate(timestamp)
    }
    if let title = object.valueForKey("title") as? String {
      cell.textLabel!.text = title
    }
  }

  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionInfo = self.fetchedResultsController.sections![section]
      return sectionInfo.name
  }

  // MARK: - Fetched results controller

  var fetchedResultsController: NSFetchedResultsController {
    if _fetchedResultsController != nil {
      return _fetchedResultsController!
    }

    let fetchRequest = NSFetchRequest()
    // Edit the entity name as appropriate.
    let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: self.managedObjectContext!)
    fetchRequest.entity = entity

    // Set the batch size to a suitable number.
    fetchRequest.fetchBatchSize = 20

    // Edit the sort key as appropriate.
    let sortDescriptors = [NSSortDescriptor(key: "category", ascending: true), NSSortDescriptor(key: "timestamp", ascending: false)]

    fetchRequest.sortDescriptors = sortDescriptors

    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: "category", cacheName: "Master")
    aFetchedResultsController.delegate = self
    _fetchedResultsController = aFetchedResultsController

    do {
      try _fetchedResultsController!.performFetch()
    } catch {
      // Replace this implementation with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      //println("Unresolved error \(error), \(error.userInfo)")
      abort()
    }

    return _fetchedResultsController!
  }
  var _fetchedResultsController: NSFetchedResultsController? = nil

  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    // In the simplest, most efficient, case, reload the table view.
    self.tableView.reloadData()
  }

}

extension MasterViewController: RWFetcherDelegate {
  func feedDataDidRefreshWithNewItemCount(newItemCount: Int) {
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
      self.tableView.reloadData()
      do {
        try self.managedObjectContext!.save()
      } catch {
        print("not saved")
      }
    })
  }
}

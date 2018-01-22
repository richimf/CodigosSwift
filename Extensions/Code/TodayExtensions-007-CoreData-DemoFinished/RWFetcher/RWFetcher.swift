
import Foundation
import CoreData

public protocol RWFetcherDelegate: class {
  func feedDataDidRefreshWithNewItemCount(newItemCount: Int)
}

public class RWFetcher: NSObject {
  private var session: NSURLSession!
  public weak var delegate: RWFetcherDelegate?
  public var managedObjectContext: NSManagedObjectContext!
  var parser = MWFeedParser()
  var newItemCount = 0

  public var sessionConfigurationIdentifier = "com.razeware.rwtracker.fetcher"

  public func start() {
    parser.delegate = self
    parser.resetForParsing()

    let config = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier(sessionConfigurationIdentifier)
    session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)
    
    let task = session.downloadTaskWithURL(NSURL(string: "http://www.raywenderlich.com/feed")!)
    task.resume()
  }
}

extension RWFetcher: NSURLSessionDownloadDelegate {
  public func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    if let feedData = NSData(contentsOfURL: location) {
      self.newItemCount = 0
      self.parser.startParsingData(feedData, textEncodingName: "utf-8")
    }
    return
  }
}

extension RWFetcher: MWFeedParserDelegate {
  public func feedParser(parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
  }

  public func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
    let categories: NSArray = item.categories
    var itemObject: NSManagedObject!

    let fetch = NSFetchRequest(entityName: "Item")
    fetch.predicate = NSPredicate(format: "identifier = %@", argumentArray: [item.identifier])
    if let results = try? managedObjectContext.executeFetchRequest(fetch) {
      if let existingItem = results.first as? NSManagedObject {
        itemObject = existingItem
      }
    }

    if itemObject == nil {
      newItemCount++
      itemObject = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext: managedObjectContext) as NSManagedObject
    }

    itemObject.setValue(item.identifier, forKey: "identifier")
    itemObject.setValue(item.content, forKey: "content")
    itemObject.setValue(item.link, forKey: "link")
    itemObject.setValue(item.date, forKey: "timestamp")
    itemObject.setValue(item.title, forKey: "title")

    if categories.containsObject("video tutorial") {
      itemObject.setValue("Video Tutorials", forKey: "category")
      itemObject.setValue(item.title.stringByReplacingOccurrencesOfString("Video Tutorial: ", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil), forKey: "title")
    } else if categories.containsObject("tutorial") {
      itemObject.setValue("Tutorials", forKey: "category")
    } else if categories.containsObject("announcements") {
      itemObject.setValue("Announcements", forKey: "category")
    } else if categories.containsObject("Podcast") {
      itemObject.setValue("Podcast Episodes", forKey: "category")
    } else {
      managedObjectContext?.deleteObject(itemObject)
    }
  }

  public func feedParserDidFinish(parser: MWFeedParser!) {
    self.delegate?.feedDataDidRefreshWithNewItemCount(newItemCount)
    session?.finishTasksAndInvalidate()
  }
}

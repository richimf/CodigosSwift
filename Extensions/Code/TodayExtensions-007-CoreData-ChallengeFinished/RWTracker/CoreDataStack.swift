
import Foundation
import CoreData

class CoreDataStack {
  
   var store:NSPersistentStore?
  
  let modelName = "RWTracker"
  
  lazy var context:NSManagedObjectContext = {
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = self.coordinator
    
    return managedObjectContext
  }()
  
  lazy var coordinator: NSPersistentStoreCoordinator = {
    
    let coordinator = NSPersistentStoreCoordinator(managedObjectModel:self.managedObjectModel)
    let documentsURL = self.applicationDocumentsDirectory
    let storeURL = documentsURL.URLByAppendingPathComponent(self.modelName)
    
    do {
      
      let options =
      [NSMigratePersistentStoresAutomaticallyOption: true]
      
      var error: NSError? = nil
      try coordinator.addPersistentStoreWithType(NSSQLiteStoreType,
        configuration: nil,
        URL: storeURL,
        options: options
      )
    } catch {
      print("Error adding persistent store: \(error)")
    }
    
    return coordinator
  }()
  
  var managedObjectModel: NSManagedObjectModel = {
  
    let bundle = NSBundle.mainBundle()
    let modelURL = bundle.URLForResource("RWTracker", withExtension:"momd")!
    
    return NSManagedObjectModel(contentsOfURL: modelURL)!
    
  }()

  
  func saveContext () {
    if context.hasChanges {
      do {
        try context.save()
      } catch let error as NSError {
        print("Could not save: \(error.localizedDescription)")
        abort()
      }
    }
  }

  func mostRecentPost() -> NSManagedObject? {
    let fetch = NSFetchRequest(entityName: "Item")
    fetch.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
let results: [AnyObject]?
    do {
      results = try context.executeFetchRequest(fetch)
    } catch {
      return nil
    }
    return results!.first as? NSManagedObject
  }

  func mostRecentPostForCategory(category: String) -> NSManagedObject? {
    let fetch = NSFetchRequest(entityName: "Item")
    fetch.predicate = NSPredicate(format: "category like %@", argumentArray: [category])
    fetch.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
    let results: [AnyObject]?
    do {
      results = try context.executeFetchRequest(fetch)
    } catch {
      return nil
    }
    return results!.first as? NSManagedObject
  }

  lazy var applicationDocumentsDirectory: NSURL = {
    let fileManager = NSFileManager.defaultManager()
    
    if let url = fileManager.containerURLForSecurityApplicationGroupIdentifier("group.com.razeware.rwtracker") {
      return url
    } else {
      let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as Array<NSURL>
      return urls[0]
    }
  }()

}
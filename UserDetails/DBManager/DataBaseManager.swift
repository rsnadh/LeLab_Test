//
//  DataBaseManager.swift
//  UserDetails
//
//  Created by Raghul S Nadh on 06/06/21.
//

import Foundation
import CoreData

///Helper class for CoreData operations
class DataBaseManager {
    let managedObjectContext:NSManagedObjectContext!
    static let shared = DataBaseManager()
    private init(){
        managedObjectContext = persistentContainer.viewContext
    }


     var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate

         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "User_Details")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

  private func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {

                    do {
                        try context.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nserror = error as NSError
                        print("Unresolved error \(nserror), \(nserror.userInfo)")
                    }
            }
    }

    func dbSave(){
        saveContext()
    }

    /// Create new managed object for an entity
    /// - Parameter entityName: Entity name for which object is to be added
    func createObjectForEntity(entityName:String)->NSManagedObject{
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext!)
    }

    /// Delete all objects in an entity
    /// - Parameter entity: Entity for which all objects are to be removed
    func deleteAllObject(entity : String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            for object in records {
                managedObjectContext.delete(object as! NSManagedObject)
            }

            saveContext()
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }

    /// Delete all objects in an entity conforming to a condition
    /// - Parameter entity: Entity from which objects are to be deleted
    /// - Parameter predicate: Predicate with condition for deletion
    func deleteAllObject(entity :String,predicate:NSPredicate) {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = predicate
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            /* Old code changed
            if records.count > 0 {
                 managedObjectContext.delete(records.first as! NSManagedObject)
            }*///Changed
            for object in records {
                           managedObjectContext.delete(object as! NSManagedObject)
                       }


        }catch let err as NSError {
            print(err.debugDescription)
        }
    }

    /// Fetch object from entity
    /// - Parameter entity: Entity from which object is to be fetched
    func fetchObject(entity :String)->NSManagedObject? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            return (0 == records.count) ? nil :(records.first as! NSManagedObject)
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return nil
    }

    /// Fetch object matching specified predicate from specified entity
    /// - Parameter entity: Entity from which object is to be fetched
    /// - Parameter predicate: Predicate with condition for fetch
    func fetchObject(entity :String,predicate:NSPredicate)->NSManagedObject? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = predicate
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            return (0 == records.count) ? nil :(records.first as! NSManagedObject)
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return nil
    }

    /// Fetch all objects matching specified predicate from specified entity
    /// - Parameter entity: Entity from which objects are to be fetched
    /// - Parameter predicate: Predicate with condition for fetch
    func fetchObjectList(entity :String,predicate:NSPredicate)->[NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = predicate
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            return (records as! [NSManagedObject])
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return nil
    }

    /// Fetch all objects in entity
    /// - Parameter entity: Entity from which objects are to be fetched
    func fetchObjectList(entity :String)->[NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            return (records as! [NSManagedObject])
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return nil
    }

    /// Fetch all objects sorted based on a condition from an entity
    /// - Parameter entity: Entity from which objects are to be fetched
    /// - Parameter sortDiscriptor: Sorting condition
    func fetchObjectList(entity :String,sortDiscriptor:[NSSortDescriptor])->[NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.sortDescriptors = sortDiscriptor
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            return (records as! [NSManagedObject])
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return nil
    }

    /// Fetch objects from entity sorted and matching a specified predicate condition
    /// - Parameter entity: Entity from which objects are to be fetched
    /// - Parameter predicate: Predicate condition
    /// - Parameter sortDiscriptor: Sorting condition
    func fetchObjectList(entity :String,predicate:NSPredicate,sortDiscriptor:[NSSortDescriptor])->[NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDiscriptor
        do {
            let records = try managedObjectContext!.fetch(fetchRequest)
            return (records as! [NSManagedObject])
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return nil
    }
}

//import Foundation
//import CoreData
//
//enum CoreDataError: Error {
//    case failedToSave
//    case failedToFetch
//}
//
//protocol CoreDataProtocol {
//
//
//    func fetch<T>(type: T.Type,
//                  sortDescriptors: [NSSortDescriptor]?,
//                  relationshipKeysToFetch: [String]?,
//                  managedObjectContext: NSManagedObjectContext,
//                  completion: @escaping (Result<[T], CoreDataError>) -> Void)
//
//    func save(managedObjectContext: NSManagedObjectContext,
//              completion: @escaping (Result<String, CoreDataError>) -> Void)
//
//    func resetAllCoreData(persistentContainer: NSPersistentContainer)
//}
//
//
//final class CoreDataService: CoreDataProtocol {
//
//    //MARK: CRUD
//
//    func fetch<T>(type: T.Type,
//                  sortDescriptors: [NSSortDescriptor]?,
//                  relationshipKeysToFetch: [String]?,
//                  managedObjectContext: NSManagedObjectContext,
//                  completion: @escaping (Result<[T], CoreDataError>) -> Void) {
//        managedObjectContext.perform {
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: type))
//            if let sortDescriptors = sortDescriptors {
//                request.sortDescriptors = sortDescriptors
//            }
//            if let relationshipKeysToFetch = relationshipKeysToFetch {
//                request.relationshipKeyPathsForPrefetching = relationshipKeysToFetch
//            }
//            do {
//                let result = try managedObjectContext.fetch(request)
//                completion(.success(result as! [T]))
//            } catch {
//                completion(.failure(CoreDataError.failedToFetch))
//            }
//        }
//    }
//
//    func save(managedObjectContext: NSManagedObjectContext,
//              completion: @escaping (Result<String, CoreDataError>) -> Void) {
//        do {
//            try managedObjectContext.save()
////            completion(.failure(CoreDataError.failedToSave))
//            completion(.success("Works"))
//        } catch {
////            completion(.success("Works"))
//            completion(.failure(CoreDataError.failedToSave))
//        }
//    }
//
//    func resetAllCoreData(persistentContainer: NSPersistentContainer) {
//        let context = persistentContainer.viewContext
//        let entityNames = persistentContainer.managedObjectModel.entities.map({ $0.name!})
//        entityNames.forEach { entityName in
//            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//            do {
//                try context.execute(deleteRequest)
//                try context.save()
//            } catch {
//                fatalError("Can't clear db")
//            }
//        }
//    }
//}


import UIKit
import CoreData

//MARK: - CRUD

public class CoreDataManager: NSObject {
    
    public static let shared = CoreDataManager()
    
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    func saveName(_ name: String) {

        guard let entity = NSEntityDescription.entity(forEntityName: "Account", in: context) else { return }
        let myName = Account(entity: entity, insertInto: context)
        myName.name = name
        appDelegate.saveContext()
    }
    
    func getName() -> [Account]? {

        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Account")
        do {
            let account = try? context.fetch(fetchRequest) as? [Account]
          
            return account
        }
    }
}

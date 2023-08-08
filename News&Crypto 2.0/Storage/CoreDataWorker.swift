import UIKit
import CoreData

final class CoreDataWorker {
    
    static let shared = CoreDataWorker()
    
    let coreDataService: CoreDataProtocol
    let persistanceContainer = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    init(coreDataService: CoreDataProtocol = CoreDataService()) {
        self.coreDataService = coreDataService
    }
    
    public func clearAll() {
        guard let container = persistanceContainer else { return }
        coreDataService.resetAllCoreData(persistentContainer: container)
    }
    
    public func saveAccount(account: Accounts) {
        guard let container = persistanceContainer else { return }
        let context = container.newBackgroundContext()
            let accountCD = Account(context: context)
            accountCD.name = account.name
            accountCD.country = account.country
            accountCD.email = account.email
            accountCD.phoneNumber = account.phoneNumber
//            accountCD.image = account.image
        
        coreDataService.save(managedObjectContext: context) { response in
            switch response {
            case .success(_):
                print("works")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func saveCoin(coin: Coin, symbol: String) {
        guard let container = persistanceContainer else { return }
        let context = container.newBackgroundContext()
        coin.coinSymbol = symbol
        coreDataService.save(managedObjectContext: context) { response in
            switch response {
            case .success(_):
                print("works")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func fetchAccount(completion: @escaping ([Account]) -> Void) {
        guard let container = persistanceContainer else { return }
        let descriptor = NSSortDescriptor(key: "name", ascending: false)
        coreDataService.fetch(type: Account.self,
                              sortDescriptors: [descriptor],
                              relationshipKeysToFetch: nil,
                              managedObjectContext: container.viewContext
        ) { (response) in
            switch response {
            case .success(let account):
                completion(account)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
    
    public func fetchCoin(completion: @escaping ([Coin]) -> Void) {
        guard let container = persistanceContainer else { return }
        let descriptor = NSSortDescriptor(key: "coinName", ascending: false)
        coreDataService.fetch(type: Coin.self,
                              sortDescriptors: [descriptor],
                              relationshipKeysToFetch: nil,
                              managedObjectContext: container.viewContext
        ) { response in
            switch response {
                
            case .success(let coin):
                completion(coin)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}

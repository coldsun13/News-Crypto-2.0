import UIKit

protocol WalletBusinessLogic
{
  func doSomething(request: Wallet.Something.Request)
}

protocol WalletDataStore
{
  //var name: String { get set }
}

class WalletInteractor: WalletBusinessLogic, WalletDataStore
{
  var presenter: WalletPresentationLogic?
  var worker: WalletWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Wallet.Something.Request)
  {
    worker = WalletWorker()
    worker?.doSomeWork()
    
    let response = Wallet.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

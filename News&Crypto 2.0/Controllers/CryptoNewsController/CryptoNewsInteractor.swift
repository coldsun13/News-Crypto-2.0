import UIKit

protocol CryptoNewsBusinessLogic
{
  func doSomething(request: CryptoNews.Something.Request)
}

protocol CryptoNewsDataStore
{
  //var name: String { get set }
}

class CryptoNewsInteractor: CryptoNewsBusinessLogic, CryptoNewsDataStore
{
  var presenter: CryptoNewsPresentationLogic?
  var worker: CryptoNewsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CryptoNews.Something.Request)
  {
    worker = CryptoNewsWorker()
    worker?.doSomeWork()
    
    let response = CryptoNews.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

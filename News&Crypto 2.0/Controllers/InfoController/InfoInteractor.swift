import UIKit

protocol InfoBusinessLogic
{
  func doSomething(request: Info.Something.Request)
}

protocol InfoDataStore
{
  //var name: String { get set }
}

class InfoInteractor: InfoBusinessLogic, InfoDataStore
{
  var presenter: InfoPresentationLogic?
  var worker: InfoWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Info.Something.Request)
  {
    worker = InfoWorker()
    worker?.doSomeWork()
    
    let response = Info.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

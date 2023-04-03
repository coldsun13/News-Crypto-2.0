import UIKit

protocol InfoPresentationLogic
{
  func presentSomething(response: Info.Something.Response)
}

class InfoPresenter: InfoPresentationLogic
{
  weak var viewController: InfoDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Info.Something.Response)
  {
    let viewModel = Info.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}

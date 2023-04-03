/import UIKit

protocol CryptoNewsPresentationLogic
{
  func presentSomething(response: CryptoNews.Something.Response)
}

class CryptoNewsPresenter: CryptoNewsPresentationLogic
{
  weak var viewController: CryptoNewsDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: CryptoNews.Something.Response)
  {
    let viewModel = CryptoNews.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}

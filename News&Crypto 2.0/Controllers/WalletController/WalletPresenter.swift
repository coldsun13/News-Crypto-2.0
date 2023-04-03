import UIKit

protocol WalletPresentationLogic
{
  func presentSomething(response: Wallet.Something.Response)
}

class WalletPresenter: WalletPresentationLogic
{
  weak var viewController: WalletDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Wallet.Something.Response)
  {
    let viewModel = Wallet.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}

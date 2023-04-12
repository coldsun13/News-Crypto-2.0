import UIKit

protocol WalletPresentationLogic {
  func presentData(response: Wallet.Model.Response.ResponseType)
}

class WalletPresenter: WalletPresentationLogic {
  weak var viewController: WalletDisplayLogic?
  
  func presentData(response: Wallet.Model.Response.ResponseType) {
  
  }
  
}

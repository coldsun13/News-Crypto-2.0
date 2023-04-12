import UIKit

protocol WalletBusinessLogic {
  func makeRequest(request: Wallet.Model.Request.RequestType)
}

class WalletInteractor: WalletBusinessLogic {

  var presenter: WalletPresentationLogic?
  var service: WalletService?
  
  func makeRequest(request: Wallet.Model.Request.RequestType) {
    if service == nil {
      service = WalletService()
    }
  }
  
}

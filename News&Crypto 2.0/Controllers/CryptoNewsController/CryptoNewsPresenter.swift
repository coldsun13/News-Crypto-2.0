import UIKit

protocol CryptoNewsPresentationLogic {
    func presentData(response: CryptoNews.Model.Response.ResponseType)
}

class CryptoNewsPresenter: CryptoNewsPresentationLogic {
    weak var viewController: CryptoNewsDisplayLogic?
    
    func presentData(response: CryptoNews.Model.Response.ResponseType) {
        switch response {
        case .some:
            print("somePresenter")
        case .presentCoins:
            print("presentNewsfeed")
            viewController?.displayData(viewModel: .displayCoins)
        }
    }
    
}

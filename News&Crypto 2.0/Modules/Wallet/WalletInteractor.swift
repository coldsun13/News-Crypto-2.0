import UIKit

protocol WalletBusinessLogic {
    func makeRequest(request: Wallet.Model.Request.RequestType)
}

class WalletInteractor: WalletBusinessLogic {
    
    var presenter: WalletPresentationLogic?
    var service: WalletService?
    
    private var fetcher = DataFetcherService()
    
    func makeRequest(request: Wallet.Model.Request.RequestType) {
        if service == nil {
            service = WalletService()
        }
        
        switch request {
            
        case .getCoins:
            fetcher.getCoins { [weak self] coinResponse in
                guard let coinResponse = coinResponse else { return }
                self?.presenter?.presentData(response: Wallet.Model.Response.ResponseType.presentCoins(coins: coinResponse))
            }
        }
    }
    
}

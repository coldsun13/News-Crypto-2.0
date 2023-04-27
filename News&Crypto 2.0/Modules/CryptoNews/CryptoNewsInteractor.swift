import UIKit

protocol CryptoNewsBusinessLogic {
  func makeRequest(request: CryptoNews.Model.Request.RequestType)
}

final class CryptoNewsInteractor: CryptoNewsBusinessLogic {
    
    var presenter: CryptoNewsPresentationLogic?
    var service: CryptoNewsService?
    
    private var fetcher = DataFetcherService()
    
    func makeRequest(request: CryptoNews.Model.Request.RequestType) {
        if service == nil {
            service = CryptoNewsService()
        }
        
        switch request {
  
        case .getCoins:
            print("interactor")
            fetcher.getCoins { [weak self] coinResponse in
                guard let coinResponse = coinResponse else { return }
                self?.presenter?.presentData(response: CryptoNews.Model.Response.ResponseType.presentCoins(coins: coinResponse))
            }
        }
        
    }
}

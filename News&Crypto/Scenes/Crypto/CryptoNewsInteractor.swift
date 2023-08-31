import UIKit

protocol CryptoNewsInteractorProtocol {
  func makeRequest(request: CryptoNews.Model.Request.RequestType)
}

final class CryptoNewsInteractor {
    
    var presenter: CryptoNewsPresenterProtocol?
    var service: CryptoNewsService?

    private var fetcher = DataFetcherService()
    
    init(service: CryptoNewsService) {
        self.service = service
    }
    
}

extension CryptoNewsInteractor: CryptoNewsInteractorProtocol {
    func makeRequest(request: CryptoNews.Model.Request.RequestType) {
        if service == nil {
            service = CryptoNewsService()
        }
        
        switch request {
  
        case .getCoins:
            fetcher.getCoins { [weak self] coinResponse in
                guard let coinResponse = coinResponse else { return }
                self?.presenter?.presentData(response: CryptoNews.Model.Response.ResponseType.presentCoins(coins: coinResponse))
            }
        }
    }

}


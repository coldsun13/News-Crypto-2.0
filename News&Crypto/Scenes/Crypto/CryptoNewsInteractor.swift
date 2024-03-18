import UIKit
import NetworkLib

protocol CryptoNewsInteractorProtocol {
    func fetchCoins()
}

final class CryptoNewsInteractor {
    
    var presenter: CryptoNewsPresenterProtocol?
    var service: CryptoNewsService?
    
    private var networkService = NetworkService()
    
    init(service: CryptoNewsService) {
        self.service = service
    }
    
}

extension CryptoNewsInteractor: CryptoNewsInteractorProtocol {
    func fetchCoins() {
        networkService.request(endpoint: CoinEndpoint.coin(currency: "usd",
                                                           order: "market_cap_desc",
                                                           perpage: "250",
                                                           page: "1",
                                                           sparkline: "true",
                                                           pricePercentage: "24h")) { [weak self] (result: Result<[CoinModel], NetworkError>) in
            
            switch result {
                
            case .success(let coinResponse):
                self?.presenter?.didFetchCoins(coin: coinResponse)
            case .failure(let error):
                print("error")
            }
        }
    }
}

import UIKit
import NetworkLib

protocol ProfileInteractorProtocol {
    func makeRequest(request: Profile.Model.Request.RequestType)
}

class ProfileInteractor {
    
    var presenter: ProfilePresenterProtocol?
    var service: ProfileService?
    
    init(service: ProfileService) {
        self.service = service
    }
    
    private var fetcher = DataFetcherService()
    
   
}

extension ProfileInteractor: ProfileInteractorProtocol {
    func makeRequest(request: Profile.Model.Request.RequestType) {
        if service == nil {
            service = ProfileService()
        }
        
        switch request {
            
        case .getCoins:
            fetcher.getCoins { [weak self] coinResponse in
                guard let coinResponse = coinResponse else { return }
                self?.presenter?.presentData(response: Profile.Model.Response.ResponseType.presentCoins(coins: coinResponse))
            }
        }
    }
}

import UIKit

protocol ProfileBusinessLogic {
    func makeRequest(request: Profile.Model.Request.RequestType)
}

class ProfileInteractor: ProfileBusinessLogic {
    
    var presenter: ProfilePresentationLogic?
    var service: ProfileService?
    
    private var fetcher = DataFetcherService()
    
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

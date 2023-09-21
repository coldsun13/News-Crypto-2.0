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
}

extension ProfileInteractor: ProfileInteractorProtocol {
    func makeRequest(request: Profile.Model.Request.RequestType) {
        if service == nil {
            service = ProfileService()
        }
        
        switch request {
            
        case .getCoins: break

        }
    }
}

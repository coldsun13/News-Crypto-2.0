import UIKit

protocol SettingsInteractorProtocol {
    func makeRequest(request: Settings.Model.Request.RequestType)
}

class SettingsInteractor: SettingsInteractorProtocol {
    
    var presenter: SettingsPresenterProtocol?
    var service: SettingsService?
    
    init(service: SettingsService) {
        self.service = service
    }
    
    func makeRequest(request: Settings.Model.Request.RequestType) {
        if service == nil {
//            service = SettingsService()
        }
        
        switch request {
            
        case .callAlert:
            presenter?.presentData(response: Settings.Model.Response.ResponseType.presentAlert(name: "Enter your name"))
        }
    }
}

extension SettingsInteractor {

}

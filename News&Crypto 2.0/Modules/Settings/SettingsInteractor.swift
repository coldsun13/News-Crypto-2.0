import UIKit

protocol SettingsBusinessLogic {
    func makeRequest(request: Settings.Model.Request.RequestType)
}

class SettingsInteractor: SettingsBusinessLogic {
    
    var presenter: SettingsPresentationLogic?
    var service: SettingsService?
    
    func makeRequest(request: Settings.Model.Request.RequestType) {
        if service == nil {
            service = SettingsService()
        }
        
        switch request {
            
        case .saveUser:
            presenter?.presentData(response: Settings.Model.Response.ResponseType.presentAlert(name: "Enter your name"))
        }
    }
}

extension SettingsInteractor {

}

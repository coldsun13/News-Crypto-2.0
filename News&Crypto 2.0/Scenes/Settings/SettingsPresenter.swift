import UIKit

protocol SettingsPresenterProtocol {
    func presentData(response: Settings.Model.Response.ResponseType)
}

class SettingsPresenter: SettingsPresenterProtocol {
    weak var viewController: SettingsDisplayLogic?
    
    func presentData(response: Settings.Model.Response.ResponseType) {
        
        switch response {
            
        case .presentAlert(name: let name):
            viewController?.displayData(viewModel: Settings.Model.ViewModel.ViewModelData.displayAlert(name: name))
        }
    }
    
}

extension SettingsPresenter {
    func presentAlertController() {
        
    }
}

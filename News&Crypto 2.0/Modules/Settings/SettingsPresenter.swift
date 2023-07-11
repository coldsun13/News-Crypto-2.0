import UIKit

protocol SettingsPresentationLogic {
    func presentData(response: Settings.Model.Response.ResponseType)
}

class SettingsPresenter: SettingsPresentationLogic {
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

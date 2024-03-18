import UIKit

final class SettingsAssemby {
    
    static func assembleModule() -> UIViewController {
        
        let service = SettingsService()
        
        let view = SettingsViewController()
        let interactor = SettingsInteractor(service: service)
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        presenter.viewController = view
        router.viewController = view
        
        return view
    }
}

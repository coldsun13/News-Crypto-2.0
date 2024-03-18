import UIKit

final class ProfileAssemplby {
    static func assembleModule() -> UIViewController {
        
        let service = ProfileService()
        
        let view = ProfileViewController()
        let interactor = ProfileInteractor(service: service)
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        presenter.viewController = view
        router.viewController = view
        
        return view
    }
}

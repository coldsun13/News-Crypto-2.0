import UIKit

final class CryptoNewsAssembly {
    
    static func assemblyModule() -> UIViewController {
        
        let service = CryptoNewsService()
        
        let view = CryptoNewsViewController()
        let interactor = CryptoNewsInteractor(service: service)
        let presenter = CryptoNewsPresenter()
        let router = CryptoNewsRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        presenter.viewController = view
        router.viewController = view
        
        return view
    }
}

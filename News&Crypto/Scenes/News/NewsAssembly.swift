import UIKit

final class NewsAssemlby {
    
    static func assembleModule() -> UIViewController {
        
        let service = NewsService()
        
        let view = NewsViewController()
        let interactor = NewsInteractor(service: service)
        let presenter = NewsPresenter()
        let router = NewsRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        presenter.viewController = view
        router.viewController = view
        
        return view
    }
}

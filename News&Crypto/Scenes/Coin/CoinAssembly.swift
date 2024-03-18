import UIKit

final class CoinAssembly {
    
    static func assemblyCoin() -> CoinController {
        
        var view = CoinController()
        var service = CoinWorker()
        var interactor = CoinInteractor(service: service)
        var presenter = CoinPresenter()
        var router = CoinRouter()
        
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.viewController = view
        router.viewController = view
        
        return view
    }
    
}

import UIKit

protocol CryptoNewsRoutingLogic {
    func openCoinController(source: UIViewController, viewModel: CoinControllerViewModel)
}

final class CryptoNewsRouter: NSObject, CryptoNewsRoutingLogic {
    
    weak var viewController: CryptoNewsViewController?
    
    // MARK: Routing
    func openCoinController(source: UIViewController, viewModel: CoinControllerViewModel) {
        let vc = CoinViewController()
        vc.set(viewModel: viewModel)
        source.present(UINavigationController(rootViewController: vc), animated: true)
    }
}

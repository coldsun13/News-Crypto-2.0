import Foundation
import UIKit

protocol CoinRouterProtocol {
    func showResultAler(source: UIViewController)
    func closeController(source: UIViewController)
}

final class CoinRouter: CoinRouterProtocol {
    
    weak var viewController: CoinController?
    
    func showResultAler(source: UIViewController) {
    
        let alert = UIAlertController(title: "Added to WatchList",
                                      message: "We've added coin to your watchlist.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil))
        source.present(alert, animated: true)
    }
    
    func closeController(source: UIViewController) {
        source.dismiss(animated: true)
    }
}

import Foundation

protocol CoinPresenterProtocol {
    func didTap()
}

final class CoinPresenter: CoinPresenterProtocol {
    
    weak var viewController: CoinViewModelProtocol?
    
    func didTap() {
        print("Hello")
        viewController?.viewModel()
    }
}

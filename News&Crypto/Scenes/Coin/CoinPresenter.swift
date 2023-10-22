import Foundation

protocol CoinPresenterProtocol {
    func didTap()
}

final class CoinPresenter: CoinPresenterProtocol {
    
    var viewController: CoinViewModelProtocol?
    
    func didTap() {
        print("презентер")
        viewController?.viewModel()
    }
}

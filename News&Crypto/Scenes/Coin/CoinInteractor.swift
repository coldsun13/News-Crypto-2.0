import UIKit
import NetworkLib


protocol CoinInteractorProtocol {
    func fetchTap()
}

final class CoinInteractor {
    
    var service: CoinWorker?
    var presenter: CoinPresenterProtocol?
    
    init(service: CoinWorker) {
        self.service = service
    }
}

extension CoinInteractor: CoinInteractorProtocol {
    
    func fetchTap() {
        presenter?.didTap()
    }
}

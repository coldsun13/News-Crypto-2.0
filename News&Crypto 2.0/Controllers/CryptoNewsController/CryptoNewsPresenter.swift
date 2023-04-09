import UIKit

protocol CryptoNewsPresentationLogic {
    func presentData(response: CryptoNews.Model.Response.ResponseType)
}

class CryptoNewsPresenter: CryptoNewsPresentationLogic {
    
    weak var viewController: CryptoNewsDisplayLogic?
    
    func presentData(response: CryptoNews.Model.Response.ResponseType) {
        switch response {
            
        case .presentCoins(let coins):
            print("presenter")
            let cells = coins.map { coinItem in
                cellViewModel(from: coinItem)
            }
            let cryptoViewModel = CryptoNewsViewModel(cell: cells)
            
            viewController?.displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData.displayCoins(cryptoViewModel: cryptoViewModel))
        }
        
    }
    
    private func cellViewModel(from coinModel: CoinModel) -> CryptoNewsViewModel.Cell {
        return CryptoNewsViewModel.Cell(price: String(coinModel.currentPrice),
                                        name: coinModel.name,
                                        abbriviatedName: coinModel.symbol,
                                        changePrice: String(coinModel.priceChange24H ?? 0.0))
    }
    
}

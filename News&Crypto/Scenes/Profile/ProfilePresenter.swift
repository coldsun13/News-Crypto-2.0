import UIKit
import UILib
import NetworkLib

protocol ProfilePresenterProtocol {
    func presentData(response: Profile.Model.Response.ResponseType)
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var viewController: ProfileDisplayLogic?
    
    func presentData(response: Profile.Model.Response.ResponseType) {
        switch response {
            
        case .presentCoins(coins: let coins):
            let cells = coins.map { coinItem in
                cellViewModel(from: coinItem)
            }
            let cryptoViewModel = ProfileViewModel(cell: cells)
            
            viewController?.displayData(viewModel: Profile.Model.ViewModel.ViewModelData.displayCoins(walletViewModel: cryptoViewModel))
        }
    }
                                        
    private func cellViewModel(from coinModel: CoinModel) -> ProfileViewModel.Cell {
        let changeColor = (coinModel.priceChangePercentage24H ?? 0.0 < 0)
        return ProfileViewModel.Cell(changePriceImage: changeColor ? Resources.Strings.Change.down.rawValue : Resources.Strings.Change.up.rawValue,
                                    abbriviatedName: coinModel.symbol,
                                    name: coinModel.name,
                                    price: coinModel.currentPrice.asCurrencyWith6Decimals(),
                                    iconUrlString: coinModel.image,
                                    changePrice: String(coinModel.priceChangePercentage24H?.asNumberString() ?? ""),
                                    cryptolineChart: CryptoLineChartView.ChartViewModel(data: coinModel.sparklineIn7D?.price ?? [],
                                                                                   showLegend: true,
                                                                                   showAxis: true,
                                                                                   fillColor: changeColor ? .systemRed : .systemGreen))
    }
}

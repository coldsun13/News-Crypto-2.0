import UIKit

protocol WalletPresentationLogic {
    func presentData(response: Wallet.Model.Response.ResponseType)
}

class WalletPresenter: WalletPresentationLogic {
    
    weak var viewController: WalletDisplayLogic?
    
    func presentData(response: Wallet.Model.Response.ResponseType) {
        switch response {
            
        case .presentCoins(coins: let coins):
            let cells = coins.map { coinItem in
                cellViewModel(from: coinItem)
            }
            let cryptoViewModel = WalletViewModel(cell: cells)
            
            viewController?.displayData(viewModel: Wallet.Model.ViewModel.ViewModelData.displayCoins(walletViewModel: cryptoViewModel))
        }
    }
                                        
    private func cellViewModel(from coinModel: CoinModel) -> WalletViewModel.Cell {
        let changeColor = (coinModel.priceChangePercentage24H ?? 0.0 < 0)
        return WalletViewModel.Cell(changePriceImage: changeColor ? Resources.Strings.Change.down.rawValue : Resources.Strings.Change.up.rawValue,
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

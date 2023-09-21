import UIKit
import UILib
import NetworkLib

protocol CryptoNewsPresenterProtocol {
    func didFetchCoins(coin: [CoinModel])
}

final class CryptoNewsPresenter {
    
    weak var viewController: CryptoNewsViewProtocol?
    
    private func cellViewModel(from coinModel: CoinModel) -> CryptoViewModel.Cell {
        let changeColor = (coinModel.priceChangePercentage24H ?? 0.0 < 0)
        return CryptoViewModel.Cell(iconURLString: coinModel.image,
                                    currentPrice: coinModel.currentPrice.asCurrencyWith6Decimals(),
                                    name: coinModel.name,
                                    abbriviatedName: coinModel.symbol.uppercased(),
                                    priceChangePercantage24h: String(coinModel.priceChangePercentage24H?.asNumberString() ?? "0.0"),
                                    cryptolineChart: CryptoLineChartView.ChartViewModel.init(data: coinModel.sparklineIn7D?.price ?? [],
                                                                                             showLegend: false,
                                                                                             showAxis: false,
                                                                                             fillColor: changeColor ? .systemRed : .systemGreen))
    }
    
    private func coinViewModel(from coinModel: CoinModel) -> CryptoViewModel.CoinViewModel {
        let changeColor = (coinModel.priceChangePercentage24H ?? 0.0 < 0)
        return CryptoViewModel.CoinViewModel(marketCapChangePercentage24h: coinModel.marketCapChangePercentage24H?.asNumberString() ?? "0.0",
                                             cryptolineChart: CryptoLineChartView.ChartViewModel.init(data: coinModel.sparklineIn7D?.price ?? [],
                                                                                                      showLegend: true,
                                                                                                      showAxis: true,
                                                                                                      fillColor: changeColor ? .systemRed : .systemGreen),
                                             currentPrice: coinModel.currentPrice.asCurrencyWith6Decimals(),
                                             priceChangePercantage24h: coinModel.priceChangePercentage24H?.asNumberString() ?? "0.0",
                                             marketCapitalization: coinModel.marketCap?.formattedWithAbbreviations() ?? "0.0",
                                             rank: String(coinModel.rank),
                                             volume: coinModel.totalVolume?.formattedWithAbbreviations() ?? "0.0",
                                             coinName: coinModel.name)
    }
}

extension CryptoNewsPresenter: CryptoNewsPresenterProtocol {
    func didFetchCoins(coin: [CoinModel]) {
        let cell = coin.map { cellViewModel(from: $0) }
        let coin = coin.map { coinViewModel(from: $0) }
        let cryptoViewModel = CryptoViewModel(models: cell, coinViewModel: coin)
        self.viewController?.displayCoin(model: cryptoViewModel)
    }
}

import UIKit
import UILib
import NetworkLib

struct CryptoViewModel {
    
    struct Cell: CryptoCellViewModel {
        
        var iconURLString: String
        var currentPrice: String
        var name: String
        var abbriviatedName: String
        var priceChangePercantage24h: String
        var cryptolineChart: CryptoLineChartView.ChartViewModel
    }
    
    let models: [Cell]
    
    struct CoinViewModel: CoinControllerViewModel {
        
        var marketCapChangePercentage24h: String
        var cryptolineChart: CryptoLineChartView.ChartViewModel
        var currentPrice: String
        var priceChangePercantage24h: String
        var marketCapitalization: String
        var rank: String
        var volume: String
        var coinName: String
    }
    
    let coinViewModel: [CoinViewModel]
}




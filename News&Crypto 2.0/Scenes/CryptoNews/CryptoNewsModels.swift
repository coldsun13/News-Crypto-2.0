import UIKit

enum CryptoNews {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getCoins
            }
        }
        struct Response {
            enum ResponseType {
                case presentCoins(coins: [CoinModel])
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayCoins(cryptoViewModel: CryptoViewModel)
            }
        }
    }
}

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




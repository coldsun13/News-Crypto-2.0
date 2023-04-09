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
                case displayCoins(cryptoViewModel: CryptoNewsViewModel)
            }
        }
    }
}

struct CryptoNewsViewModel {
    struct Cell: CryptoCellViewModel {
        var iconURLString: String
        var price: String
        var name: String
        var abbriviatedName: String
        var changePrice: String
        var cryptolineChart: CryptoLineChartView.ViewModel
    }
    
    let cell: [Cell] 
}

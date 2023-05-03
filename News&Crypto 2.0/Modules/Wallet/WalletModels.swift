import UIKit

enum Wallet {
    
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
                case displayCoins(walletViewModel: WalletViewModel)
            }
        }
    }
}

struct WalletViewModel {
    struct Cell: WalletCellViewModel {
        
        var changePriceImage: String
        var abbriviatedName: String
        var name: String
        var price: String
        var iconUrlString: String
        var changePrice: String
        var cryptolineChart: CryptoLineChartView.ChartViewModel
    }
    
    let cell: [Cell]
}

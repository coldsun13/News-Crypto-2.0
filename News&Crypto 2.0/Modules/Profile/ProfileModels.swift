import UIKit

enum Profile {
    
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
                case displayCoins(walletViewModel: ProfileViewModel)
            }
        }
    }
}

struct ProfileViewModel {
    struct Cell: ProfileCellViewModel {
        
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

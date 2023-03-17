import UIKit

class TabBarController: UITabBarController {

    var dataFetcherService = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFetcherService.fetchCoins { coins in
            print(coins?.first)
        }
    }


}


import Foundation

class DataFetcherService {
    
    private enum API {
        static let news = "https://finnhub.io/api/v1/"
        static let coins = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    }
    
    private enum Endpoint {
        static let search = "search?q="
        static let topStories = "news?category=general&"
        static let apiKey = "&token=c9m61diad3i9qg80n940"
    }

    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchNews(completion: @escaping ([NewsModel]?) -> Void) {
        let urlNews = API.news + Endpoint.topStories + Endpoint.apiKey
        dataFetcher.fetchGenericData(urlString: urlNews, response: completion)
    }
    
    func fetchCoins(completion: @escaping ([CoinModel]?) -> Void) {
        let urlCoins = API.coins
        dataFetcher.fetchGenericData(urlString: urlCoins, response: completion)
    }
}

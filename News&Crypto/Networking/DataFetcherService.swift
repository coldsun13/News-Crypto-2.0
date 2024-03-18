import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func getNews(completion: @escaping ([NewsModel]?) -> Void) {
        let urlNews = API.news + API.topStories + API.apiKey
        dataFetcher.fetchGenericData(urlString: urlNews, response: completion)
    }
    
    func getCoins(completion: @escaping ([CoinModel]?) -> Void) {
        let urlCoins = API.coins
        dataFetcher.fetchGenericData(urlString: urlCoins, response: completion)
    }
}

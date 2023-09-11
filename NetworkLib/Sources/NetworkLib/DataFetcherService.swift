import Foundation

public class DataFetcherService {
    
    public var dataFetcher: DataFetcher
    
    public init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    public func getNews(completion: @escaping ([NewsModel]?) -> Void) {
        let urlNews = API.news + API.topStories + API.apiKey
        dataFetcher.fetchGenericData(urlString: urlNews, response: completion)
    }
    
    public func getCoins(completion: @escaping ([CoinModel]?) -> Void) {
        let urlCoins = API.coins
        dataFetcher.fetchGenericData(urlString: urlCoins, response: completion)
    }
}

import Foundation
import NetworkLib

protocol NewsInteractorProtocol {
    func fetchNews()
}

class NewsInteractor {
    
    var presenter: NewsPresenterProtocol?
    
    private var service: NewsService?
    private var networkService = NetworkService()
    private var storage = StorageManager()
    
    init(service: NewsService) {
        self.service = service
    }
    
}

extension NewsInteractor: NewsInteractorProtocol {
    
    func fetchNews() {
            networkService.request(endpoint: NewsEndpoint.news(category: "general",
                                                               token: storage.string(forKey: .token) ?? "")) { [weak self] (result: Result<[NewsModel], NetworkError>) in
                switch result {
                    
                case .success(let newsResponse):
                    self?.presenter?.didFetchNews(news: newsResponse)
                case .failure(let error):
                    print(error)
                }
            }
        }
}

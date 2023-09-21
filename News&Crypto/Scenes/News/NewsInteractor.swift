import Foundation
import NetworkLib

protocol NewsInteractorProtocol {
    func fetchNews()
}

class NewsInteractor {
    
    var presenter: NewsPresenterProtocol?
    
    private var service: NewsService?
    private var networkService = NetworkService()
    
    init(service: NewsService) {
        self.service = service
    }
    
}

extension NewsInteractor: NewsInteractorProtocol {
    
    func fetchNews() {
            networkService.request(endpoint: NewsEndpoint.news(category: "general",
                                                               token: "c9m61diad3i9qg80n940")) { [weak self] (result: Result<[NewsModel], NetworkError>) in
                switch result {
                    
                case .success(let newsResponse):
                    self?.presenter?.didFetchNews(news: newsResponse)
                case .failure(let error):
                    print(error)
                }
            }
        }
}

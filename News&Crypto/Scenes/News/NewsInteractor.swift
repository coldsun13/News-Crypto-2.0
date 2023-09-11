import Foundation
import NetworkLib

protocol NewsInteractorProtocol {
    func makeRequest(request: News.Model.Request.RequestType)
}

class NewsInteractor {
    
    var presenter: NewsPresenterProtocol?
    
    private var service: NewsService?
    private var fetcher = DataFetcherService()
    
    init(service: NewsService) {
        self.service = service
    }
    
}

extension NewsInteractor: NewsInteractorProtocol {
    
    func makeRequest(request: News.Model.Request.RequestType) {
        if service == nil {
            service = NewsService()
        }
        
        switch request {
            
        case .getNews:
            fetcher.getNews { [weak self] newsResponse in
                guard let newsResponse = newsResponse else { return }
                self?.presenter?.presentData(response: News.Model.Response.ResponseType.presentNews(news: newsResponse))
            }
        }
    }

}

import UIKit

protocol NewsBusinessLogic {
    func makeRequest(request: News.Model.Request.RequestType)
}

class NewsInteractor: NewsBusinessLogic {
    
    var presenter: NewsPresentationLogic?
    var service: NewsService?
    
    private var fetcher = DataFetcherService()
    
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

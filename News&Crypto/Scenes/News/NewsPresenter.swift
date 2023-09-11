import UIKit
import NetworkLib

protocol NewsPresenterProtocol {
    func presentData(response: News.Model.Response.ResponseType)
}

class NewsPresenter {
    
    weak var viewController: NewsViewProtocol?
    
    private func cellViewModel(from newsModel: NewsModel) -> NewsViewModel.News {
        return NewsViewModel.News(url: newsModel.url,
                                  image: newsModel.image,
                                  headline: newsModel.headline,
                                  source: newsModel.source,
                                  date: .stringDate(from: newsModel.datetime))
    }
}

extension NewsPresenter: NewsPresenterProtocol {
    
    func presentData(response: News.Model.Response.ResponseType) {
        switch response {
            
        case .presentNews(news: let news):
            let news = news.map { newsItem in
                cellViewModel(from: newsItem)
            }
            
            let newsViewModel = NewsViewModel(models: news)
            
            viewController?.displayData(viewModel: News.Model.ViewModel.ViewModelData.displayNews(newsViewModel: newsViewModel))
        }
    }
}


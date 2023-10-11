import UIKit
import NetworkLib

protocol NewsPresenterProtocol {
    func didFetchNews(news: [NewsModel])
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
    func didFetchNews(news: [NewsModel]) {
        let models = news.map { cellViewModel(from: $0) }
        let newsViewModel = NewsViewModel(models: models)
        viewController?.displayNews(viewModel: newsViewModel)
    }
}

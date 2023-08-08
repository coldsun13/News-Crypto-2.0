import UIKit

protocol NewsPresentationLogic {
    func presentData(response: News.Model.Response.ResponseType)
}

class NewsPresenter: NewsPresentationLogic {
    
    weak var viewController: NewsDisplayLogic?
    
    func presentData(response: News.Model.Response.ResponseType) {
        switch response {
            
        case .presentNews(news: let news):
            let news = news.map { newsItem in
                cellViewModel(from: newsItem)
            }
            
            let newsViewModel = NewsViewModel(cell: news)
            
            viewController?.displayData(viewModel: News.Model.ViewModel.ViewModelData.displayNews(newsViewModel: newsViewModel))
        }
    }
    
    private func cellViewModel(from newsModel: NewsModel) -> NewsViewModel.Cell {
        return NewsViewModel.Cell(url: newsModel.url,
                                  image: newsModel.image,
                                  headline: newsModel.headline,
                                  source: newsModel.source,
                                  date: .stringDate(from: newsModel.datetime))
    }
}

import UIKit
import UILib

enum News {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getNews
            }
        }
        struct Response {
            enum ResponseType {
                case presentNews(news: [NewsModel])
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayNews(newsViewModel: NewsViewModel)
            }
        }
    }
}

struct NewsViewModel {
    
    struct News: NewsCellViewModel {
        // udalti protocol
        var url: String
        var image: String
        var headline: String
        var source: String
        var date: String
    }
    
    let models: [News]
}

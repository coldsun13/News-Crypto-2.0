import Foundation

public enum NewsEndpoint {
    case news(category: String, token: String)
}

extension NewsEndpoint: Endpoint {
    
    public var host: String {
        return "finnhub.io"
    }
    
    public var path: String {
        switch self {
        case .news:
            return "/api/v1/news"
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        var queryItems: [URLQueryItem]?
        switch self {
        case .news(let category, let token):
            queryItems = [
                URLQueryItem(name: "category", value: category),
                URLQueryItem(name: "token", value: token),
            ]
        }
        return queryItems
    }
    
    public var method: RequestMethod {
        switch self {
        case .news:
            return .get
        }
    }
}

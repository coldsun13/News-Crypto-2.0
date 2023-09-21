import Foundation

public enum CoinEndpoint {
    case coin(currency: String, order: String, perpage: String, page: String, sparkline: String, pricePercentage: String)
}

extension CoinEndpoint: Endpoint {
    
    public var host: String {
        return "api.coingecko.com"
    }
    
    public var path: String {
        switch self {
        case .coin:
            return "/api/v3/coins/markets"
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        var queryItems: [URLQueryItem]?
        switch self {
        case .coin(let currency, let order, let perpage, let page, let sparkline, let pricePercentage):
            queryItems = [
                URLQueryItem(name: "vs_currency", value: currency),
                URLQueryItem(name: "order", value: order),
                URLQueryItem(name: "per_page", value: perpage),
                URLQueryItem(name: "page", value: page),
                URLQueryItem(name: "sparkline", value: sparkline),
                URLQueryItem(name: "price_change_percentage", value: pricePercentage),
            ]
        }
        return queryItems
    }
    
    public var method: RequestMethod {
        switch self {
        case .coin:
            return .get
        }
    }
}

import Foundation

public struct CoinModel: Identifiable, Decodable {

    public let id, symbol, name: String
    public let image: String
    public let currentPrice: Double
    public let marketCap, marketCapRank, fullyDilutedValuation: Double?
    public let totalVolume, high24H, low24H: Double?
    public let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    public let circulatingSupply, totalSupply, maxSupply, ath: Double?
    public let athChangePercentage: Double?
    public let athDate: String?
    public let atl, atlChangePercentage: Double?
    public let atlDate: String?
    public let lastUpdated: String?
    public let sparklineIn7D: SparklineIn7D?
    public let priceChangePercentage24HInCurrency: Double?
    public let currentHoldings: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    public var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

public struct SparklineIn7D: Codable {
    public let price: [Double]?
}



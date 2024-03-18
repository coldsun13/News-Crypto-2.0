import Foundation

public struct NewsModel: Decodable {

    public let category: String
    public let datetime: TimeInterval
    public let headline: String
    public let image: String
    public let related: String
    public let source: String
    public let summary: String
    public let url: String
}

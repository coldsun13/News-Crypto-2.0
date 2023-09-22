import Foundation

public enum NetworkError: Error {
    case decode
    case custom(String)
    
    var title: String {
        switch self {
        case .decode: return "Fail of parse data"
        case .custom(let title): return title
        }
    }
    
}

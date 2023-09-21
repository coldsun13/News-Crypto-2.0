import UIKit
import UILib
import NetworkLib




struct NewsViewModel {
    
    struct News: NewsCellViewModel {
        var url: String
        var image: String
        var headline: String
        var source: String
        var date: String
    }
    
    let models: [News]
}

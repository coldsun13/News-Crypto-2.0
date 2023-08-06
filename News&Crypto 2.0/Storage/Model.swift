import Foundation
import UIKit

struct Accounts {
    var country: String
    var phoneNumber: String
    var email: String
    var name: String
//    var image: Data {
//        didSet { _ = UIImage(data: image)! 
//        }
//    }
}

extension Accounts: Codable { }

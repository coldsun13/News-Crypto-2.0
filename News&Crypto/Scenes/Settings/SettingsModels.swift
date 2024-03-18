import UIKit

enum Settings {
    
    enum Model {
        struct Request {
            enum RequestType {
                case callAlert
//                case saveProfile(profile: Accounts)
            }
        }
        struct Response {
            enum ResponseType {
                case presentAlert(name: String)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayAlert(name: String)
            }
        }
    }
}

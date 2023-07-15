import UIKit

enum Settings {
    
    enum Model {
        struct Request {
            enum RequestType {
                case saveUser
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

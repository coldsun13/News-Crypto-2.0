import UIKit

enum Resources {
    
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleGray = UIColor(hexString: "#545C77")
        static let secondary = UIColor(hexString: "#F0F3FF")
        static let backgound = UIColor(hexString: "#F8F9F9")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .cryptoNews:
                    return "Home"
                case .wallet:
                    return "Wallet"
                case .info:
                    return "Info"
                case .settings:
                    return "Settings"
                }
            }
        }
    }
    
    enum Tabbar {
        static func icon(for tab: Tabs) -> UIImage? {
            
            switch tab {
            case .cryptoNews: return UIImage(systemName: "house")
            case .wallet: return UIImage(systemName: "wallet.pass")
            case .info: return UIImage(systemName: "person")
            case .settings: return UIImage(systemName: "gear")
            }
        }
    }
}

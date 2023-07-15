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
                case .profile:
                    return "Profile"
                case .settings:
                    return "Settings"
                }
            }
        }
        
        enum Change: String {
            case up = "arrowtriangle.up.fill"
            case down = "arrowtriangle.down.fill"
        }
        
        enum FontWeight: String {
            case bold = "Montserrat-Bold"
            case medium = "Montserrat-Medium"
            case regular = "Montserrat-Regular"
            case semibold = "Montserrat-SemiBold"
        }
    }
    
    enum Images {
        static let avatarImage = UIImage(systemName: "person.crop.circle.fill")
        static let languageImage = UIImage(systemName: "globe")
        static let colormodeImage = UIImage(systemName: "moon")
        static let phoneImage = UIImage(systemName: "phone")
        static let cryptoNewsImage = UIImage(systemName: "house")
        static let walletImage = UIImage(systemName: "wallet.pass")
        static let infoImage = UIImage(systemName: "person")
        static let settingsImage = UIImage(systemName: "gear")
        static let countyImage = UIImage(systemName: "flag")
        static let arrowImage = UIImage(systemName: "chevron.right")
        
        enum Tabbar {
            static func icon(for tab: Tabs) -> UIImage? {
                
                switch tab {
                case .cryptoNews: return Resources.Images.cryptoNewsImage
                case .profile: return Resources.Images.walletImage
                case .settings: return Resources.Images.settingsImage
                }
            }
        }
    }
}

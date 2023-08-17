import UIKit

public enum Resources {
    
    public enum Tabs: Int, CaseIterable {
        case cryptoNews
        case profile
        case settings
    }
    
    public enum Colors {
        public static let active = UIColor(hexString: "#437BFE")
        public static let inactive = UIColor(hexString: "#929DA5")
        public static let separator = UIColor(hexString: "#E8ECEF")
        public static let titleGray = UIColor(hexString: "#545C77")
        public static let secondary = UIColor(hexString: "#F0F3FF")
        public static let backgound = UIColor(hexString: "#F8F9F9")
    }
    
    public enum Strings {
        public enum TabBar {
            public static func title(for tab: Tabs) -> String {
                
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
        
        public enum Change: String {
            case up = "arrowtriangle.up.fill"
            case down = "arrowtriangle.down.fill"
        }
        
        public enum FontWeight: String {
            case bold = "Montserrat-Bold"
            case medium = "Montserrat-Medium"
            case regular = "Montserrat-Regular"
            case semibold = "Montserrat-SemiBold"
        }
    }
    
    @available(iOS 13.0, *)
    public enum Images {
        public static let avatarImage = UIImage(systemName: "person.crop.circle.fill")
        public static let languageImage = UIImage(systemName: "globe")
        public static let colormodeImage = UIImage(systemName: "moon")
        public static let phoneImage = UIImage(systemName: "phone")
        public static let cryptoNewsImage = UIImage(systemName: "house")
        public static let walletImage = UIImage(systemName: "wallet.pass")
        public static let infoImage = UIImage(systemName: "person")
        public static let settingsImage = UIImage(systemName: "gear")
        public static let countyImage = UIImage(systemName: "flag")
        public static let arrowImage = UIImage(systemName: "chevron.right")
        
        public enum Tabbar {
            public static func icon(for tab: Tabs) -> UIImage? {
                
                switch tab {
                case .cryptoNews: return Resources.Images.cryptoNewsImage
                case .profile: return Resources.Images.walletImage
                case .settings: return Resources.Images.settingsImage
                }
            }
        }
    }
}

import UIKit

enum Tabs: Int, CaseIterable {
    case cryptoNews
    case profile
    case settings
}

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

private extension TabBarController {
    
    func getController(tabs: Tabs) -> UIViewController {
        switch tabs {
            
        case .cryptoNews:
            return CryptoNewsViewController()
        case .profile:
            return ProfileNavigationController(rootViewController: ProfileViewController())
        case .settings:
            return SettingsViewController()
        }
    }
    
    func configureAppearance() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.cornerRadius = 10
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        
        let controllers: [UIViewController] = Tabs.allCases.map { tab in
            let controller = getController(tabs: tab)
            controller.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.title(for: tab),
                                                 image: Resources.Images.Tabbar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        setViewControllers(controllers, animated: true)
    }
}

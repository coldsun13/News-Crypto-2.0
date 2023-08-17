import UIKit
import UILib

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

private extension TabBarController {
    
    func getController(tabs: Resources.Tabs) -> UIViewController {
        switch tabs {
            
        case .cryptoNews:
            return CryptoNewsAssembly.assemblyModule()
        case .profile:
            return ProfileNavigationController(rootViewController: ProfileAssemplby.assembleModule())
        case .settings:
            return SettingsAssemby.assembleModule()
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
        
        let controllers: [UIViewController] = Resources.Tabs.allCases.map { tab in
            let controller = getController(tabs: tab)
            controller.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.title(for: tab),
                                                 image: Resources.Images.Tabbar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        setViewControllers(controllers, animated: true)
    }
}

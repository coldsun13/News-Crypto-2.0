import UIKit

public class ProfileNavigationController: UINavigationController  {
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = Resources.Images.avatarImage
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.tintColor = .systemGray3
        return avatarImageView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

extension ProfileNavigationController: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController,
                                     willShow viewController: UIViewController,
                                     animated: Bool) {
        
        navigationBar.subviews.forEach { subview in
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            guard stringFromClass.contains("_UINavigationBarLargeTitleView") && avatarImageView.superview != subview else { return }
            
            avatarImageView.removeFromSuperview()
            subview.addSubview(avatarImageView)
            
            guard let superview = avatarImageView.superview else { return }
            
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            avatarImageView.removeConstraints(avatarImageView.constraints)
            
            avatarImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
            avatarImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
            avatarImageView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -10).isActive = true
            avatarImageView.trailingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        }
    }
}

private extension ProfileNavigationController {
    
    func configureAppearance() {
//        avatarImageView.image = Resources.Images.avatarImage
//        avatarImageView.contentMode = .scaleAspectFit
//        avatarImageView.tintColor = .systemGray3
        delegate = self
        navigationBar.prefersLargeTitles = true
    }
}

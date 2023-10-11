import UIKit

public protocol HeaderViewDelegate: AnyObject {
    func revealAlertController()
    func changePhotoAvatarImage()
    func transferEmailString(email: String)
    func transferNameString(name: String)
}

public final class HeaderView: UIView {
    
    enum Constant {
        static let changeInfoButtonWidthSize: CGFloat = 130
        
        static let avatarImageViewHeightSize: CGFloat = 80
    }
    
    private lazy var headerStackView: UIStackView = {
       let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.spacing = 15
        headerStackView.distribution = .equalSpacing
        headerStackView.alignment = .center
        return headerStackView
    }()
    
    private lazy var nameLabel: UILabel = {
       let nameLabel = UILabel()
        nameLabel.font = .montserrat(20, .semibold)
        return nameLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.font = .montserrat(14, .medium)
        emailLabel.textColor = .gray
        return emailLabel
    }()
    
    private lazy var avatarImageView: UIImageView = {
       let avatarImageView = UIImageView()
        avatarImageView.image = Resources.Images.avatarImage
        avatarImageView.tintColor = .systemGray3
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(changePhotoAvatarAction))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tap)
        return avatarImageView
    }()
    
    private lazy var changeInfoButton: UIButton = {
       let changeInfoButton = UIButton()
        changeInfoButton.backgroundColor = .blue
        changeInfoButton.layer.cornerRadius = 10
        changeInfoButton.setTitle("Edit profile", for: .normal)
        changeInfoButton.titleLabel?.font = .montserrat(15, .semibold)
        changeInfoButton.addTarget(self, action: #selector(changeInfoAction), for: .touchUpInside)
        return changeInfoButton
    }()
    
    public weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HeaderView {
    
    func drawSelf() {
        addSubviewsAndMask(headerStackView)
        headerStackView.addAllArrangedSubviews(avatarImageView,
                                               nameLabel,
                                               emailLabel,
                                               changeInfoButton)
        let headerStackViewConstraints = self.setHeaderStackViewConstraints()
        let changeInfoButtonConstraints = self.setChangeInfoButtonConstraints()
        let avatarImageViewConstraints = self.setAvatarImageConstraints()
        
        NSLayoutConstraint.activate(headerStackViewConstraints +
                                    changeInfoButtonConstraints +
                                    avatarImageViewConstraints)
    }
    
    func setHeaderStackViewConstraints() -> [NSLayoutConstraint] {
        let centerXAnchor = headerStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        let centerYAnchor = headerStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        return [centerYAnchor,
                centerXAnchor]
    }
    
    func setChangeInfoButtonConstraints() -> [NSLayoutConstraint] {
        let width = changeInfoButton.widthAnchor.constraint(equalToConstant: Constant.changeInfoButtonWidthSize)
        return [width]
    }
    
    func setAvatarImageConstraints() -> [NSLayoutConstraint] {
        let heightAnchor = avatarImageView.heightAnchor.constraint(equalToConstant: Constant.avatarImageViewHeightSize)
        let widthAnchor = avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
        return [heightAnchor,
                widthAnchor]
    }
    
    func configureAppearance() {
        backgroundColor = .white
    }
    
    @objc func changeInfoAction() {
        delegate?.revealAlertController()
    }
    
    @objc func changePhotoAvatarAction() {
        delegate?.changePhotoAvatarImage()
    }
}

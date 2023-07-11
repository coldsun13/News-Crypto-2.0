import UIKit

protocol HeaderViewDelegate: AnyObject {
    func revealAlertController()
    func changePhotoAvatarImage()
}

final class HeaderView: UIView {
    
    private let headerStackView = UIStackView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let changeInfoButton = UIButton()
    
    weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HeaderView {
    
    func addSubviews() {
        addSubviewsAndMask(headerStackView)
        headerStackView.addAllArrangedSubviews(avatarImageView,
                                               nameLabel,
                                               emailLabel,
                                               changeInfoButton)
    }
    
    func addConstraints() {
        headerStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        changeInfoButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor).isActive = true
    }
    
    func configureAppearance() {
        backgroundColor = .white
        setupHeaderStackView()
        setupChangeInfoButton()
        setupAvatarImageView()
        setupLabels()
    }
    
    func setupLabels() {
        nameLabel.text = "Ihar Tsimafeyeu"
        nameLabel.font = .montserrat(20, .semibold)
        emailLabel.text = "coldsun@email.com"
        emailLabel.font = .montserrat(14, .medium)
        emailLabel.textColor = .gray
    }
    
    func setupHeaderStackView() {
        headerStackView.axis = .vertical
        headerStackView.spacing = 15
        headerStackView.distribution = .equalSpacing
        headerStackView.alignment = .center
    }
    
    func setupChangeInfoButton() {
        changeInfoButton.backgroundColor = .blue
        changeInfoButton.layer.cornerRadius = 10
        changeInfoButton.setTitle("Edit profile", for: .normal)
        changeInfoButton.titleLabel?.font = .montserrat(15, .semibold)
        changeInfoButton.addTarget(self, action: #selector(changeInfoAction), for: .touchUpInside)
    }
    
    func setupAvatarImageView() {
        avatarImageView.image = Resources.Images.avatarImage
        avatarImageView.tintColor = .systemGray3
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(changePhotoAvatarAction))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tap)
    }
    
    @objc func changeInfoAction() {
        delegate?.revealAlertController()
    }
    
    @objc func changePhotoAvatarAction() {
        delegate?.changePhotoAvatarImage()
    }
}

import UIKit

final class HeaderView: UIView {
    
    private let headerStackView = UIStackView()
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let avatarImage = UIImageView()
    private let changeInfoButton = UIButton()
    
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
        headerStackView.addAllArrangedSubviews(avatarImage,
                                               nameLabel,
                                               emailLabel,
                                               changeInfoButton)
    }
    
    func addConstraints() {
        headerStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        changeInfoButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        avatarImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor).isActive = true
    }
    
    func configureAppearance() {
        backgroundColor = .white
        headerStackView.axis = .vertical
        headerStackView.spacing = 15
        headerStackView.distribution = .equalSpacing
        headerStackView.alignment = .center
        nameLabel.text = "Ihar Tsimafeyeu"
        nameLabel.font = .montserrat(20, .semibold)
        emailLabel.text = "coldsun@email.com"
        emailLabel.font = .montserrat(14, .medium)
        emailLabel.textColor = .gray
        avatarImage.image = Resources.Images.avatarImage
        avatarImage.tintColor = .systemGray3
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        changeInfoButton.backgroundColor = .blue
        changeInfoButton.layer.cornerRadius = 10
        changeInfoButton.setTitle("Edit profile", for: .normal)
        changeInfoButton.titleLabel?.font = .montserrat(15, .semibold)
        changeInfoButton.addTarget(self, action: #selector(changeInfoAction), for: .touchUpInside)
    }
    
    @objc func changeInfoAction() {
        
    }
}

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func setName(_ name: String)
}

final class ProfileView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .gray
        nameLabel.font = .montserrat(15, .regular)
        nameLabel.text = "Name:"
        return nameLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.textColor = .gray
        emailLabel.font = .montserrat(15, .regular)
        emailLabel.text = "E-mail:"
        return emailLabel
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.textColor = .gray
        phoneNumberLabel.font = .montserrat(15, .regular)
        phoneNumberLabel.text = "Phone:"
        return phoneNumberLabel
    }()
    
    private lazy var countryLabel: UILabel = {
        let countryLabel = UILabel()
        countryLabel.textColor = .gray
        countryLabel.text = "Country:"
        countryLabel.font = .montserrat(15, .regular)
        return countryLabel
    }()
    
    private lazy var profileNameLabel: UILabel = {
        let profileNameLabel = UILabel()
        profileNameLabel.textColor = .gray
        profileNameLabel.font = .montserrat(15, .regular)
        return profileNameLabel
    }()
    
    private var account = [Account]()
    
    weak var delegate: ProfileViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setName(name: String) {
        profileNameLabel.text = name
    }
}

private extension ProfileView {
    
    func addSubviews() {
        addSubviewsAndMask(nameLabel,
                           emailLabel,
                           phoneNumberLabel,
                           countryLabel, profileNameLabel)
    }
    
    func addConstraints() {
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        countryLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        profileNameLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -15).isActive = true
    }
}

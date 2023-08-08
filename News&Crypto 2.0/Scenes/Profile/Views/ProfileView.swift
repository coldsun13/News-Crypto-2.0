import UIKit

protocol ProfileViewDelegate: AnyObject {
    func setName(_ name: String)
}

final class ProfileView: UIView {
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let countryLabel = UILabel()
    private let profileNameLabel = UILabel()
    
    private var account = [Account]()
    
    weak var delegate: ProfileViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        account = CoreDataManager.shared.getName()!
        addSubviews()
        addConstraints()
        configureAppearance()
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
    
    func configureAppearance() {
        nameLabel.textColor = .gray
        nameLabel.font = .montserrat(15, .regular)
        
        emailLabel.textColor = .gray
        emailLabel.font = .montserrat(15, .regular)
        
        phoneNumberLabel.textColor = .gray
        phoneNumberLabel.font = .montserrat(15, .regular)
        
        countryLabel.textColor = .gray
        countryLabel.font = .montserrat(15, .regular)
        
        profileNameLabel.textColor = .gray
        profileNameLabel.font = .montserrat(15, .regular)
        
        nameLabel.text = "Name:"
        emailLabel.text = "E-mail:"
        phoneNumberLabel.text = "Phone:"
        countryLabel.text = "Country:"
        
//        profileNameLabel.text = String(account[0])
    }
    
   
}

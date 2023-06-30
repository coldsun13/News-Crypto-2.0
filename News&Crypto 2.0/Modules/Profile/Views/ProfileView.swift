import UIKit

final class ProfileView: UIView {
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let countryLabel = UILabel()
    
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

private extension ProfileView {
    
    func addSubviews() {
        addSubviewsAndMask(nameLabel,
                           emailLabel,
                           phoneNumberLabel,
                           countryLabel)
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
        
        nameLabel.text = "Name:"
        emailLabel.text = "E-mail:"
        phoneNumberLabel.text = "Phone:"
        countryLabel.text = "Country:"
    }
}
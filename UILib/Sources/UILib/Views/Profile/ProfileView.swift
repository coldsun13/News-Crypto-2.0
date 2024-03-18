import UIKit

protocol ProfileViewDelegate: AnyObject {
    func setName(_ name: String)
}

public final class ProfileView: UIView {
    
    enum Constants {
        static let nameLabelTopInset: CGFloat = 15
        static let nameLabelLeadingInset: CGFloat = 15
        
        static let emailLabelTopInset: CGFloat = 20
        static let emailLabelLeadingInset: CGFloat = 15
        
        static let phoneNumberLabelTopInset: CGFloat = 20
        static let phoneNumberLeadingInset: CGFloat = 15
        
        static let countryLabelTopInset: CGFloat = 20
        static let countryLabelLeadingInset: CGFloat = 15
        
        static let profileNameLabelTopInset: CGFloat = 20
        static let profileNameLabelTrailingInset: CGFloat = -15
    }
    
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
    
    weak var delegate: ProfileViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setName(name: String) {
        profileNameLabel.text = name
    }
}

private extension ProfileView {
    
    func drawSelf() {
        addSubviewsAndMask(nameLabel,
                           emailLabel,
                           phoneNumberLabel,
                           countryLabel,
                           profileNameLabel)
        let nameLabelConstraints = self.setNameLabelConstraints()
        let emailLabelConstraints = self.setEmailLabelConstraints()
        let phoneNumberLabelConstraints = self.setPhoneNumberLabelConstraints()
        let countryNumberLabelConstraints = self.setCountryLabelConstraints()
        let profileNameLabelConstraints = self.setProfileNameConstraints()
        
        NSLayoutConstraint.activate(nameLabelConstraints +
                                    emailLabelConstraints +
                                    phoneNumberLabelConstraints +
                                    countryNumberLabelConstraints +
                                    profileNameLabelConstraints)
    }
    
    
    func setNameLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.nameLabelTopInset)
        let leadingAnchor = nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.nameLabelLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setEmailLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.emailLabelTopInset)
        let leadingAnchor = emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.emailLabelLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setPhoneNumberLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Constants.phoneNumberLabelTopInset)
        let leadingAnchor = phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.phoneNumberLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setCountryLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = countryLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: Constants.countryLabelTopInset)
        let leadingAnchor = countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.countryLabelLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setProfileNameConstraints() -> [NSLayoutConstraint] {
        let topAnchor = profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.profileNameLabelTopInset)
        let trailingAnchor = profileNameLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.profileNameLabelTrailingInset)
        return [topAnchor,
                trailingAnchor]
    }
}

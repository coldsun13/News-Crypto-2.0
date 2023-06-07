import UIKit

final class AccountView: UIView {
    
    private let countryLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    
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

private extension AccountView {
    
    func addSubviews() {
        addSubviewsAndMask(countryLabel,
                           phoneNumberLabel)
    }
    
    func addConstraints() {
        countryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        phoneNumberLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    func configureAppearance() {
        phoneNumberLabel.font = .montserrat(15, .medium)
        phoneNumberLabel.addImageInText(systemImage: Resources.Images.phoneImage!, text: "  Phone")
        countryLabel.font = .montserrat(15, .medium)
        countryLabel.addImageInText(systemImage: Resources.Images.countyImage!, text: "  Country")
    }
}

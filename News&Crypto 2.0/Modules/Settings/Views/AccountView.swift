import UIKit

protocol AccountViewDelegate: AnyObject {
    func saveCountry(country: String)
    func saveNumber(number: String)
}

final class AccountView: UIView {
    
    weak var delegate: AccountViewDelegate?
    
    private let countryLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let acceptCountryButton = UIButton()
    private let acceptNumberButton = UIButton()
    private let countryNameTextField = UITextField()
    private let numberNameTextField = UITextField()
    
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
                           phoneNumberLabel,
                           acceptCountryButton,
                           acceptNumberButton, numberNameTextField, countryNameTextField)
    }
    
    func addConstraints() {
        countryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        phoneNumberLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        acceptCountryButton.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor).isActive = true
        acceptCountryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        acceptNumberButton.centerYAnchor.constraint(equalTo: phoneNumberLabel.centerYAnchor).isActive = true
        acceptNumberButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        countryNameTextField.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor).isActive = true
        countryNameTextField.trailingAnchor.constraint(equalTo: acceptCountryButton.leadingAnchor, constant: -20).isActive = true
        countryNameTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        countryNameTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        numberNameTextField.centerYAnchor.constraint(equalTo: phoneNumberLabel.centerYAnchor).isActive = true
        numberNameTextField.trailingAnchor.constraint(equalTo: acceptNumberButton.leadingAnchor, constant: -20).isActive = true
        numberNameTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        numberNameTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configureAppearance() {
        phoneNumberLabel.font = .montserrat(15, .medium)
        phoneNumberLabel.addImageInText(systemImage: Resources.Images.phoneImage!, text: "  Phone")
        countryLabel.font = .montserrat(15, .medium)
        countryLabel.addImageInText(systemImage: Resources.Images.countyImage!, text: "  Country")
        acceptNumberButton.setImage(Resources.Images.arrowImage, for: .normal)
        acceptCountryButton.setImage(Resources.Images.arrowImage, for: .normal)
        acceptCountryButton.tintColor = .black
        acceptNumberButton.tintColor = .black
        
        acceptNumberButton.addTarget(self, action: #selector(changeNumberAction), for: .touchUpInside)
        acceptCountryButton.addTarget(self, action: #selector(changeCountryAction), for: .touchUpInside)
        
        countryNameTextField.layer.cornerRadius = 10
        numberNameTextField.layer.cornerRadius = 10
        
        countryNameTextField.layer.borderWidth = 1.0
        numberNameTextField.layer.borderWidth = 1.0
        
        countryNameTextField.layer.borderColor = UIColor.black.cgColor
        numberNameTextField.layer.borderColor = UIColor.black.cgColor
        
        countryNameTextField.font = .montserrat(10, .regular)
        numberNameTextField.font = .montserrat(10, .regular)
        
        countryNameTextField.addLeftView(spacing: 10)
        numberNameTextField.addLeftView(spacing: 10)
    }
    
    @objc func changeNumberAction() {
        delegate?.saveNumber(number: "hello")
    }
    
    @objc func changeCountryAction() {
        delegate?.saveCountry(country: "privet")
    }
}

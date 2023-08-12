import UIKit

protocol AccountViewDelegate: AnyObject {
    func transferCountryString(string: String)
    func transferPhoneNumberString(string: String)
}

final class AccountView: UIView {
    
    weak var delegate: AccountViewDelegate?
    
//    private let countryLabel = UILabel()
//    private let phoneNumberLabel = UILabel()
//    private let acceptCountryButton = UIButton()
//    private let acceptNumberButton = UIButton()
//    private let countryNameTextField = UITextField()
//    private let numberNameTextField = UITextField()
    
    private lazy var countryLabel: UILabel = {
        let countryLabel = UILabel()
        countryLabel.font = .montserrat(15, .medium)
        countryLabel.addImageInText(systemImage: Resources.Images.countyImage!, text: "  Country")
        return countryLabel
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.font = .montserrat(15, .medium)
        phoneNumberLabel.addImageInText(systemImage: Resources.Images.phoneImage!, text: "  Phone")
        return phoneNumberLabel
    }()
    
    private lazy var acceptCountryButton: UIButton = {
        let acceptCountryButton = UIButton()
        acceptCountryButton.setImage(Resources.Images.arrowImage, for: .normal)
        acceptCountryButton.tintColor = .black
        acceptCountryButton.addTarget(self, action: #selector(changeCountryAction), for: .touchUpInside)
        return acceptCountryButton
    }()
    
    private lazy var acceptNumberButton: UIButton = {
        let acceptNumberButton = UIButton()
        acceptNumberButton.setImage(Resources.Images.arrowImage, for: .normal)
        acceptNumberButton.tintColor = .black
        acceptNumberButton.addTarget(self, action: #selector(changeNumberAction), for: .touchUpInside)
        return acceptNumberButton
    }()
    
    private lazy var countryNameTextField: UITextField = {
        let countryNameTextField = UITextField()
        countryNameTextField.layer.cornerRadius = 10
        countryNameTextField.layer.borderWidth = 1.0
        countryNameTextField.layer.borderColor = UIColor.black.cgColor
        countryNameTextField.font = .montserrat(10, .regular)
        countryNameTextField.addLeftView(spacing: 10)
        return countryNameTextField
    }()
    
    private lazy var numberNameTextField: UITextField = {
        let numberNameTextField = UITextField()
        numberNameTextField.layer.cornerRadius = 10
        numberNameTextField.layer.borderWidth = 1.0
        numberNameTextField.font = .montserrat(10, .regular)
        numberNameTextField.font = .montserrat(10, .regular)
        numberNameTextField.addLeftView(spacing: 10)
        return numberNameTextField
    }()
    
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
                           acceptNumberButton,
                           numberNameTextField,
                           countryNameTextField)
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
//        phoneNumberLabel.font = .montserrat(15, .medium)
//        phoneNumberLabel.addImageInText(systemImage: Resources.Images.phoneImage!, text: "  Phone")
//        countryLabel.font = .montserrat(15, .medium)
//        countryLabel.addImageInText(systemImage: Resources.Images.countyImage!, text: "  Country")
//        acceptNumberButton.setImage(Resources.Images.arrowImage, for: .normal)
//
//        acceptNumberButton.tintColor = .black
        
//        acceptCountryButton.setImage(Resources.Images.arrowImage, for: .normal)
//        acceptCountryButton.tintColor = .black
//        countryNameTextField.layer.cornerRadius = 10
//        numberNameTextField.layer.cornerRadius = 10
//
//        countryNameTextField.layer.borderWidth = 1.0
//        numberNameTextField.layer.borderWidth = 1.0
//
//        countryNameTextField.layer.borderColor = UIColor.black.cgColor
//        numberNameTextField.layer.borderColor = UIColor.black.cgColor
//
//        countryNameTextField.font = .montserrat(10, .regular)
//        numberNameTextField.font = .montserrat(10, .regular)
//
//        countryNameTextField.addLeftView(spacing: 10)
//        numberNameTextField.addLeftView(spacing: 10)
    }
    
    @objc func changeNumberAction() {
        delegate?.transferCountryString(string: countryNameTextField.text ?? "")
    }
    
    @objc func changeCountryAction() {
        delegate?.transferPhoneNumberString(string: numberNameTextField.text ?? "")
    }
}

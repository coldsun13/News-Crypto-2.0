import UIKit
import UILib

protocol AccountViewDelegate: AnyObject {
    func transferCountryString(string: String)
    func transferPhoneNumberString(string: String)
}

final class AccountView: UIView {
    
    weak var delegate: AccountViewDelegate?
    
    enum Constant {
        static let countryLabelTopInset: CGFloat = 10
        static let countryLabelLeadingInset: CGFloat = 10
        
        static let phoneNumberTopInset: CGFloat = 20
        static let phoneNumberLeadingInset: CGFloat = 10
        
        static let acceptCountryButtonTrailingInset: CGFloat = -10
        
        static let acceptNumberButtomTrailingInset: CGFloat = -10
        
        static let countryNameTextFieldTrailingInset: CGFloat = -20
        static let countryNameTextFieldWidhtSize: CGFloat = 100
        static let countryNameTextFieldHeightSize: CGFloat = 20
        
        static let numberNameTextFieldTrailingInset: CGFloat = -20
        static let numberNameTextFieldWidthSize: CGFloat = 100
        static let numberNameTextFieldHeightSize: CGFloat = 20
    }
    
    private lazy var countryLabel: UILabel = {
        let countryLabel = UILabel()
//        countryLabel.font = .montserrat(15, .medium)
        countryLabel.addImageInText(systemImage: Resources.Images.countyImage!, text: "  Country")
        return countryLabel
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
//        phoneNumberLabel.font = .montserrat(15, .medium)
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
//        countryNameTextField.font = .montserrat(10, .regular)
        countryNameTextField.addLeftView(spacing: 10)
        return countryNameTextField
    }()
    
    private lazy var numberNameTextField: UITextField = {
        let numberNameTextField = UITextField()
        numberNameTextField.layer.cornerRadius = 10
        numberNameTextField.layer.borderWidth = 1.0
//        numberNameTextField.font = .montserrat(10, .regular)

        numberNameTextField.addLeftView(spacing: 10)
        return numberNameTextField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AccountView {
    
    func drawSelf() {
        addSubviewsAndMask(countryLabel,
                           phoneNumberLabel,
                           acceptCountryButton,
                           acceptNumberButton,
                           numberNameTextField,
                           countryNameTextField)
        let countryLabelConstraints = self.setCountryLabelConstraints()
        let phoneNumberLabelConstraints = self.setPhoneNumberLabelConstraints()
        let acceptCountryButtomConstraints = self.setAcceptCountryButtonConstraints()
        let acceptNumberButtomConstraints = self.setAcceptNumberButtonConstraints()
        let countryNameTextConstraints = self.setCountryNameTextFieldConstraints()
        let nameTextFieldConstraints = self.setNameTextFieldConstraints()
        
        NSLayoutConstraint.activate(countryLabelConstraints +
                                    phoneNumberLabelConstraints +
                                    acceptCountryButtomConstraints +
                                    acceptNumberButtomConstraints +
                                    countryNameTextConstraints +
                                    nameTextFieldConstraints)
    }
    
    func setCountryLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = countryLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.countryLabelTopInset)
        let leadingAnchor = countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.countryLabelLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setPhoneNumberLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = phoneNumberLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: Constant.phoneNumberTopInset)
        let leadingAnchor = phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.phoneNumberLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setAcceptCountryButtonConstraints() -> [NSLayoutConstraint] {
        let centerYAnchor = acceptCountryButton.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor)
        let trailingAnchor = acceptCountryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.acceptCountryButtonTrailingInset)
        return [centerYAnchor,
                trailingAnchor]
    }
    
    func setAcceptNumberButtonConstraints() -> [NSLayoutConstraint] {
        let centerYAnchor = acceptNumberButton.centerYAnchor.constraint(equalTo: phoneNumberLabel.centerYAnchor)
        let trailingAnchor = acceptNumberButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.acceptNumberButtomTrailingInset)
        return [centerYAnchor,
                trailingAnchor]
    }
    
    func setCountryNameTextFieldConstraints() -> [NSLayoutConstraint] {
        let centerYAnchor = countryNameTextField.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor)
        let trailingAnchor = countryNameTextField.trailingAnchor.constraint(equalTo: acceptCountryButton.leadingAnchor, constant: Constant.countryNameTextFieldTrailingInset)
        let width = countryNameTextField.widthAnchor.constraint(equalToConstant: Constant.countryNameTextFieldWidhtSize)
        let height = countryNameTextField.heightAnchor.constraint(equalToConstant: Constant.countryNameTextFieldHeightSize)
        return [centerYAnchor,
                trailingAnchor,
                width,
                height]
    }
    
    func setNameTextFieldConstraints() -> [NSLayoutConstraint] {
        let centerYAnchor = numberNameTextField.centerYAnchor.constraint(equalTo: phoneNumberLabel.centerYAnchor)
        let trailingAnchor = numberNameTextField.trailingAnchor.constraint(equalTo: acceptNumberButton.leadingAnchor, constant: Constant.numberNameTextFieldTrailingInset)
        let width = numberNameTextField.widthAnchor.constraint(equalToConstant: Constant.numberNameTextFieldWidthSize)
        let height = numberNameTextField.heightAnchor.constraint(equalToConstant: Constant.numberNameTextFieldHeightSize)
        return [centerYAnchor,
                trailingAnchor,
                width,
                height]
    }
  
    
    @objc func changeNumberAction() {
        delegate?.transferCountryString(string: countryNameTextField.text ?? "")
    }
    
    @objc func changeCountryAction() {
        delegate?.transferPhoneNumberString(string: numberNameTextField.text ?? "")
    }
}


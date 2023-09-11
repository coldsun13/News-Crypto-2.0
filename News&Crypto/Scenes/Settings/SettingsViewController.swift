import UIKit
import UILib

protocol SettingsDisplayLogic: AnyObject {
    func displayData(viewModel: Settings.Model.ViewModel.ViewModelData)
}

class SettingsViewController: UIViewController, SettingsDisplayLogic {
    
    var interactor: SettingsInteractorProtocol?
    var router: (NSObjectProtocol & SettingsRoutingLogic)?
    
    enum Constant {
        static let accountLabelTopInset: CGFloat = 20
        static let accountLabelLeadingInset: CGFloat = 10
        
        static let accountViewTopInset: CGFloat = 10
        static let accountViewHeightSize: CGFloat = 120
        
        static let preferencesLabelTopInset: CGFloat = 20
        static let preferencesLabelLeadingInset: CGFloat = 10
        
        static let prefencesViewTopInset: CGFloat = 10
        
        static let saveButtonBottomInset: CGFloat = -120
    }
    
    private lazy var headerView: HeaderView = {
        let headerView = HeaderView()
        headerView.backgroundColor = .white
        headerView.delegate = self
        return headerView
    }()
    
    private lazy var acccountView: AccountView = {
        let acccountView = AccountView()
        acccountView.backgroundColor = .white
        acccountView.delegate = self
        return acccountView
    }()
    
    private lazy var preferencesView: PreferencesView = {
        let preferencesView = PreferencesView()
        
        return preferencesView
    }()
    
    private lazy var accountLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.text = "Account"
        accountLabel.addCharacterSpacing(kernValue: 1.25)
        accountLabel.font = .montserrat(12, .bold)
        accountLabel.textColor = .systemGray2
        return accountLabel
    }()
    
    private lazy var preferencesLabel: UILabel = {
        let preferencesLabel = UILabel()
        preferencesLabel.text = "Preferences"
        preferencesLabel.addCharacterSpacing(kernValue: 1.25)
        preferencesLabel.font = .montserrat(12, .bold)
        preferencesLabel.textColor = .systemGray2
        return preferencesLabel
    }()
    
    private lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.setTitle("НАЖМИ СУКА", for: .normal)
        saveButton.tintColor = .black
        saveButton.backgroundColor = .black
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        return saveButton
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        print(infoData)
        print("Hello")
    }
    
    func displayData(viewModel: Settings.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayAlert(name: let name):
            router?.revealAlertController(name)
        }
    }
}

private extension SettingsViewController {
    
    func addSubviews() {
        view.addSubviewsAndMask(headerView,
                                acccountView,
                                preferencesView,
                                accountLabel,
                                preferencesLabel)
        preferencesView.addSubviewsAndMask(saveButton)
        let headerViewConstraints = self.setHeaderViewConstraints()
        let accountLabelConstraints = self.setAccountLabelConstraints()
        let acccountViewConstraints = self.setAccountViewConstraints()
        let preferencesLabelConstraints = self.setPreferncesLabelConstraints()
        let preferencesViewConstraints = self.setPreferencesViewConstraints()
        let saveButtonConstraints = self.setSaveButtonConstraints()
        
        NSLayoutConstraint.activate(headerViewConstraints +
                                    accountLabelConstraints +
                                    acccountViewConstraints +
                                    preferencesLabelConstraints +
                                    preferencesViewConstraints +
                                    saveButtonConstraints)
    }
    
    func setHeaderViewConstraints() -> [NSLayoutConstraint] {
        let leadingAnchor = headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingAnchor = headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let topAnchor = headerView.topAnchor.constraint(equalTo: view.topAnchor)
        let headerAnchor = headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        return [leadingAnchor,
                trailingAnchor,
                topAnchor,
                headerAnchor]
    }
    
    func setAccountLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = accountLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Constant.accountLabelTopInset)
        let leadingAnchor = accountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.accountLabelLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setAccountViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = acccountView.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: Constant.accountViewTopInset)
        let trailingAnchor = acccountView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let leadingAnchor = acccountView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let height = acccountView.heightAnchor.constraint(equalToConstant: Constant.accountViewHeightSize)
        return [topAnchor,
                trailingAnchor,
                leadingAnchor,
                height]
    }
    
    func setPreferncesLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = preferencesLabel.topAnchor.constraint(equalTo: acccountView.bottomAnchor, constant: Constant.preferencesLabelTopInset)
        let leadingAnchor = preferencesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.preferencesLabelLeadingInset)
        return [topAnchor,
                leadingAnchor]
    }
    
    func setPreferencesViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = preferencesView.topAnchor.constraint(equalTo: preferencesLabel.bottomAnchor, constant: Constant.prefencesViewTopInset)
        let leadingAnchor = preferencesView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingAnchor = preferencesView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomAnchor = preferencesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        return [topAnchor,
                leadingAnchor,
                trailingAnchor,
                bottomAnchor]
    }
    
    func setSaveButtonConstraints() -> [NSLayoutConstraint] {
        let bottomAnchor = saveButton.bottomAnchor.constraint(equalTo: preferencesView.bottomAnchor, constant: Constant.saveButtonBottomInset)
        let centerXAnchor = saveButton.centerXAnchor.constraint(equalTo: preferencesView.centerXAnchor)
        return [bottomAnchor,
                centerXAnchor]
    }
    
    func configureAppearance() {
        view.backgroundColor = .systemGray6
    }
    
    @objc func saveButtonAction() {
//        interactor?.makeRequest(request: Settings.Model.Request.RequestType.saveProfile(profile: <#T##Accounts#>))
//        let myAcc = Accounts(country: <#T##String#>, phoneNumber: <#T##String#>, email: <#T##String#>, name: <#T##String#>, image: <#T##Data#>)
//        let coreManager = CoreDataWorker.shared
//        coreManager.saveAccount(account: infoData)
//        print(accountsData)
    }
}

// Сохранить кордату и передать в роутер

extension SettingsViewController: HeaderViewDelegate {
    func transferEmailString(email: String) {
//        infoData.email = email
    }

    func transferNameString(name: String) {
//        infoData.name = name
    }
    
    func revealAlertController() {
        interactor?.makeRequest(request: Settings.Model.Request.RequestType.callAlert)
    }
    
    func changePhotoAvatarImage() {
        router?.showImagePicker()
    }
}

extension SettingsViewController: AccountViewDelegate {
    func transferCountryString(string: String) {
//        infoData.country = string
//        print("\(infoData)")
//        print(string)
    }
    
    func transferPhoneNumberString(string: String) {
//        infoData.phoneNumber = string
//        print(string)
    }
}

extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
//        if let image = info[.editedImage] as? UIImage {
//
//        }
//        if let image = info[.originalImage] as? UIImage {
//
//        }
    }
}


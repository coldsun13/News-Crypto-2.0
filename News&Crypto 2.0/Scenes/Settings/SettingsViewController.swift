import UIKit

protocol SettingsDisplayLogic: AnyObject {
    func displayData(viewModel: Settings.Model.ViewModel.ViewModelData)
}

class SettingsViewController: UIViewController, SettingsDisplayLogic {
    
    var interactor: SettingsBusinessLogic?
    var router: (NSObjectProtocol & SettingsRoutingLogic)?
    
    private let headerView = HeaderView()
    private let acccountView = AccountView()
    private let preferencesView = PreferencesView()
    
    private let accountLabel = UILabel()
    private let preferencesLabel = UILabel()
    private let saveButton = UIButton()
    
//    var infoData = Accounts(country: "hello", phoneNumber: "hello", email: "hello", name: "hello", image: (Resources.Images.arrowImage?.pngData())!)
    var infoData = Accounts(country: "hello", phoneNumber: "hello", email: "hello", name: "hello")

    var accountsData = Account()
//    var infoEmail = String()
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = SettingsInteractor()
        let presenter             = SettingsPresenter()
        let router                = SettingsRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(infoData)
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
    }
    
    func addConstraints() {
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        accountLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        accountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        acccountView.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 10).isActive = true
        acccountView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        acccountView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        acccountView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        preferencesLabel.topAnchor.constraint(equalTo: acccountView.bottomAnchor, constant: 20).isActive = true
        preferencesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        preferencesView.topAnchor.constraint(equalTo: preferencesLabel.bottomAnchor, constant: 10).isActive = true
        preferencesView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        preferencesView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        preferencesView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: preferencesView.bottomAnchor, constant: -120).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: preferencesView.centerXAnchor).isActive = true
    }
    
    func configureAppearance() {
        view.backgroundColor = .systemGray6
        headerView.backgroundColor = .white
        acccountView.backgroundColor = .white
        accountLabel.text = "Account"
        accountLabel.addCharacterSpacing(kernValue: 1.25)
        accountLabel.font = .montserrat(12, .bold)
        accountLabel.textColor = .systemGray2
        preferencesLabel.text = "Preferences"
        preferencesLabel.addCharacterSpacing(kernValue: 1.25)
        preferencesLabel.font = .montserrat(12, .bold)
        preferencesLabel.textColor = .systemGray2
        headerView.delegate = self
        acccountView.delegate = self
        saveButton.setTitle("НАЖМИ СУКА", for: .normal)
        saveButton.tintColor = .black
        saveButton.backgroundColor = .black
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    @objc func saveButtonAction() {
//        interactor?.makeRequest(request: Settings.Model.Request.RequestType.saveProfile(profile: <#T##Accounts#>))
//        let myAcc = Accounts(country: <#T##String#>, phoneNumber: <#T##String#>, email: <#T##String#>, name: <#T##String#>, image: <#T##Data#>)
        let coreManager = CoreDataWorker.shared
        coreManager.saveAccount(account: infoData)
//        print(accountsData)
    }
}

// Сохранить кордату и передать в роутер 

extension SettingsViewController: HeaderViewDelegate {
    func transferEmailString(email: String) {
        infoData.email = email
    }

    func transferNameString(name: String) {
        infoData.name = name
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
        infoData.country = string
//        print("\(infoData)")
        print(string)
    }
    
    func transferPhoneNumberString(string: String) {
        infoData.phoneNumber = string
        print(string)
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


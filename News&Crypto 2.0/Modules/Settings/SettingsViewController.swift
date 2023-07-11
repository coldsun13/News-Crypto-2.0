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
    }
}

extension SettingsViewController: HeaderViewDelegate {
    
    func revealAlertController() {
        interactor?.makeRequest(request: Settings.Model.Request.RequestType.saveUser)
    }
    
    func changePhotoAvatarImage() {
        router?.showImagePicker()
    }
}

extension SettingsViewController: AccountViewDelegate {
    func saveCountry(country: String) {
        print("saveC")
    }
    
    func saveNumber(number: String) {
        print("saveN")
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


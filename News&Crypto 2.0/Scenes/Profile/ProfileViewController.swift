import UIKit

protocol ProfileDisplayLogic: AnyObject {
    func displayData(viewModel: Profile.Model.ViewModel.ViewModelData)
}

class ProfileViewController: UIViewController, ProfileDisplayLogic {

    var interactor: ProfileBusinessLogic?
    var router: (NSObjectProtocol & ProfileRoutingLogic)?
    
    private var storageService: PersistenceStorage?

//    private let scrollView = UIScrollView()
//    private let mainStackView = UIStackView()
//    private let profileInfoView = ProfileView()
    private var profileViewModel = ProfileViewModel(cell: [])
    private let layout = CustomFlowLayout(width: 300, height: 400)
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
//    private lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView()
//        collectionView.frame = .zero
//        collectionView.collectionViewLayout = layout
//        return collectionView
//    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
       let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        return mainStackView
    }()
    
    private lazy var profileInfoView: ProfileView = {
       let profileInfoView = ProfileView()
        
        return profileInfoView
    }()
    
    
    
    var accmy = [Accounts]()

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAccounts { card in
            self.accmy = card
        }
        print(accmy)
    }
    
    func getAccounts(completion: @escaping ([Accounts]) -> Void) {
        CoreDataWorker.shared.fetchAccount { fetchedAccounts in

            var accounts = [Accounts]()
            for account in fetchedAccounts {
                let account = Accounts(country: account.country ?? "",
                                       phoneNumber: account.phoneNumber ?? "",
                                       email: account.email ?? "",
                                       name: account.name ?? "")
                accounts.append(account)
            }
            completion(accounts)
        }
    }
    
//    func get
    func getAccounts2(completion: @escaping ([Accounts]) -> Void) {
        CoreDataWorker.shared.fetchAccount { fetchedAccounts in
            var accounts = [Accounts]()
//            accounts.append(Accounts(country: fetchedAccounts., phoneNumber: <#T##String#>, email: <#T##String#>, name: <#T##String#>))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController        = self
        let interactor            = ProfileInteractor()
        let presenter             = ProfilePresenter()
        let router                = ProfileRouter()
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
        interactor?.makeRequest(request: Profile.Model.Request.RequestType.getCoins)
    }

    func displayData(viewModel: Profile.Model.ViewModel.ViewModelData) {
        switch viewModel {

        case .displayCoins(walletViewModel: let walletViewModel):
            self.profileViewModel = walletViewModel
            collectionView.reloadData()
        }
    }
}

private extension ProfileViewController {

    func addSubviews() {
        view.addSubviewsAndMask(scrollView)
        scrollView.addSubviewsAndMask(mainStackView)
        mainStackView.addAllArrangedSubviews(profileInfoView, collectionView)
    }

    func addConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

        profileInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
        profileInfoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }

    func configureAppearance() {
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
        title = "Profile"
        view.backgroundColor = .white
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileViewModel.cell.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier,
                                                            for: indexPath) as? ProfileCell else { return UICollectionViewCell() }
        let cellViewModel = profileViewModel.cell[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }

}

//extension ProfileViewController: ProfileViewDelegate {
//    func setName(_ name: String) {
//        CoreDataManager.getName(<#T##self: CoreDataManager##CoreDataManager#>)
//    }
    
    
//}


////            account.append(Accounts(country: card.country!, phoneNumber: card.phoneNumber!, email: card.email!, name: card.name!))
////            account.append(Accounts(country: card., phoneNumber: <#T##String#>, email: <#T##String#>, name: <#T##String#>))
////            account.append(Accounts(country: card.country, phoneNumber: <#T##String#>, email: <#T##String#>, name: A))
////            account?.append(Accounts(country: card., phoneNumber: <#T##String#>, email: <#T##String#>, name: A))
//            account?.append(Accounts(country: card., phoneNumber: <#T##String#>, email: <#T##String#>, name: <#T##String#>))

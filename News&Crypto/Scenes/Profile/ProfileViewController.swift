import UIKit
import UILib

protocol ProfileDisplayLogic: AnyObject {
    func displayData(viewModel: Profile.Model.ViewModel.ViewModelData)
}

class ProfileViewController: UIViewController, ProfileDisplayLogic {
    
    var interactor: ProfileInteractorProtocol?
    var router: (NSObjectProtocol & ProfileRoutingLogic)?
    
//    private var storageService: PersistenceStorage?
    
    private var profileViewModel = ProfileViewModel(cell: [])
    private let layout = CustomFlowLayout(width: 300, height: 400)
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
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
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        drawSelf()
        configureAppearance()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        getAccounts { card in
//            self.accmy = card
//        }
//        print(accmy)
//    }
//
//    func getAccounts(completion: @escaping ([Accounts]) -> Void) {
//        CoreDataWorker.shared.fetchAccount { fetchedAccounts in
//
//            var accounts = [Accounts]()
//            for account in fetchedAccounts {
//                let account = Accounts(country: account.country ?? "",
//                                       phoneNumber: account.phoneNumber ?? "",
//                                       email: account.email ?? "",
//                                       name: account.name ?? "")
//                accounts.append(account)
//            }
//            completion(accounts)
//        }
//    }
    
    //    func get
//    func getAccounts2(completion: @escaping ([Accounts]) -> Void) {
//        CoreDataWorker.shared.fetchAccount { fetchedAccounts in
//            var accounts = [Accounts]()
//            //            accounts.append(Accounts(country: fetchedAccounts., phoneNumber: <#T##String#>, email: <#T##String#>, name: <#T##String#>))
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
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
    
    func drawSelf() {
        view.addSubviewsAndMask(scrollView)
        scrollView.addSubviewsAndMask(mainStackView)
        mainStackView.addAllArrangedSubviews(profileInfoView, collectionView)
        let scrollViewConstraints = self.setScrollViewConstraints()
        let mainStackViewConstraints = self.setMainStackViewConstraints()
        let profileInfoViewConstraints = self.setProfileInfoViewConstraints()
        let collectionViewConstraints = self.setCollectionViewConstraints()
        
        NSLayoutConstraint.activate(scrollViewConstraints +
                                    mainStackViewConstraints +
                                    profileInfoViewConstraints +
                                    collectionViewConstraints)
    }
    
    func setScrollViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingAnchor = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingAnchor = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomAnchor = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        return [topAnchor,
                leadingAnchor,
                trailingAnchor,
                bottomAnchor]
    }
    
    func setMainStackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingAnchor = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingAnchor = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomAnchor = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        return [topAnchor,
                leadingAnchor,
                trailingAnchor,
                bottomAnchor]
    }
    
    func setProfileInfoViewConstraints() -> [NSLayoutConstraint] {
        let heightAnchor = profileInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5)
        let widthAnchor = profileInfoView.widthAnchor.constraint(equalTo: view.widthAnchor)
        return [heightAnchor,
                widthAnchor]
    }
    
    func setCollectionViewConstraints() -> [NSLayoutConstraint] {
        let height = collectionView.heightAnchor.constraint(equalToConstant: 500)
        let width = collectionView.widthAnchor.constraint(equalTo: view.widthAnchor)
        return [height, width]
    }
    
    func configureAppearance() {
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


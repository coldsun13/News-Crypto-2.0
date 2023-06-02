import UIKit

protocol WalletDisplayLogic: AnyObject {
    func displayData(viewModel: Wallet.Model.ViewModel.ViewModelData)
}

class WalletViewController: UIViewController, WalletDisplayLogic {
    
    var interactor: WalletBusinessLogic?
    var router: (NSObjectProtocol & WalletRoutingLogic)?
    
    private var walletViewModel = WalletViewModel(cell: [])
    private let layout = CustomFlowLayout(width: 300, height: 400) 
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = WalletInteractor()
        let presenter             = WalletPresenter()
        let router                = WalletRouter()
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
        interactor?.makeRequest(request: Wallet.Model.Request.RequestType.getCoins)
    }
    
    func displayData(viewModel: Wallet.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayCoins(walletViewModel: let walletViewModel):
            self.walletViewModel = walletViewModel
            collectionView.reloadData()
        }
    }
}

private extension WalletViewController {
    
    func configure() {

        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(WalletCell.self, forCellWithReuseIdentifier: WalletCell.identifier)
    }
}

extension WalletViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return walletViewModel.cell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCell.identifier,
                                                            for: indexPath) as? WalletCell else { return UICollectionViewCell() }
        let cellViewModel = walletViewModel.cell[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }
    
}

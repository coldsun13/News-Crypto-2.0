import UIKit

protocol WalletDisplayLogic: AnyObject {
    func displayData(viewModel: Wallet.Model.ViewModel.ViewModelData)
}

class WalletViewController: UIViewController, WalletDisplayLogic {
    
    var interactor: WalletBusinessLogic?
    var router: (NSObjectProtocol & WalletRoutingLogic)?
    
    private var walletViewModel = WalletViewModel(cell: [])
    private let tableView = UITableView()
    
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
            tableView.reloadData()
        }
    }
}

private extension WalletViewController {
    
    func configure() {
        
        view.backgroundColor = .white

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(WalletCell.self, forCellReuseIdentifier: WalletCell.identifier)
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walletViewModel.cell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WalletCell.identifier, for: indexPath) as? WalletCell else { return UITableViewCell() }
        let cellViewModel = walletViewModel.cell[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }
}

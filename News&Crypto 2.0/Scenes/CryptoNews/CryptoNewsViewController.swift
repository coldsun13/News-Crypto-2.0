import UIKit
import FloatingPanel

protocol CryptoNewsDisplayLogic: AnyObject {
    func displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData)
}

final class CryptoNewsViewController: UIViewController, CryptoNewsDisplayLogic {
    
    var interactor: CryptoNewsBusinessLogic?
    var router: (NSObjectProtocol & CryptoNewsRoutingLogic)?
    let dataFetcher = DataFetcherService()
//    var coin = Coin()
    
    private var cryptoViewModel = CryptoViewModel(cell: [], coinViewModel: []) {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var panel: FloatingPanelController = {
        let panel = FloatingPanelController()
        return panel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.identifier)
        return tableView
    }()
    
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
        let interactor            = CryptoNewsInteractor()
        let presenter             = CryptoNewsPresenter()
        let router                = CryptoNewsRouter()
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
        configure()
        setupFloatingPanel()
        interactor?.makeRequest(request: CryptoNews.Model.Request.RequestType.getCoins)
    }
    
    func displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayCoins(let cryptoViewModel):
            self.cryptoViewModel = cryptoViewModel
        }
    }
}

private extension CryptoNewsViewController {
    
    func configure() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupFloatingPanel() {
        let vc = NewsViewController()
        panel.set(contentViewController: vc)
        panel.surfaceView.appearance.cornerRadius = 20
        panel.addPanel(toParent: self)
    }
}

extension CryptoNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoViewModel.cell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier, for: indexPath) as? CryptoCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.set(viewModel: cryptoViewModel.cell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.openCoinController(source: self, viewModel: cryptoViewModel.coinViewModel[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
////            CoreDataWorker.saveCoin(coin, coin: cryptoViewModel.coinViewModel[indexPath.row].coinName)
//            CoreDataWorker.shared.saveCoin(coin: Coin(), symbol: cryptoViewModel.coinViewModel[indexPath.row].coinName)
//            print("saveCoreData")
//        }
    }
}

import UIKit
import FloatingPanel

protocol CryptoNewsDisplayLogic: AnyObject {
    func displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData)
}

final class CryptoNewsViewController: UIViewController, CryptoNewsDisplayLogic {
    
    var interactor: CryptoNewsBusinessLogic?
    var router: (NSObjectProtocol & CryptoNewsRoutingLogic)?
    var dataFetcher = DataFetcherService()
    
    private var cryptoNewsViewModel = CryptoViewModel(cell: [], coinViewModel: [])
    private let panel = FloatingPanelController()
    private let tableView = UITableView()
    
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
        interactor?.makeRequest(request: CryptoNews.Model.Request.RequestType.getCoins)
    }
    
    func displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayCoins(let cryptoViewModel):
            self.cryptoNewsViewModel = cryptoViewModel
            tableView.reloadData()
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.identifier)
    }
    
    func setupFloatingPanel() {
        let vc = NewsViewController()
//        panel.surfaceView.backgroundColor = .theme.cellColor
        panel.set(contentViewController: vc)
        panel.surfaceView.appearance.cornerRadius = 20
        panel.addPanel(toParent: self)
        
    }
}

extension CryptoNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoNewsViewModel.cell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier, for: indexPath) as? CryptoCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.set(viewModel: cryptoNewsViewModel.cell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinVC = CoinViewController()
        let wallet = cryptoNewsViewModel.coinViewModel[indexPath.row]
        coinVC.set(info: wallet)
        present(UINavigationController(rootViewController: coinVC), animated: true)
    }
}

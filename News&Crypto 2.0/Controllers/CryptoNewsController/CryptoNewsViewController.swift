import UIKit

protocol CryptoNewsDisplayLogic: AnyObject {
    func displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData)
}

final class CryptoNewsViewController: UIViewController, CryptoNewsDisplayLogic {
    
    var interactor: CryptoNewsBusinessLogic?
    var router: (NSObjectProtocol & CryptoNewsRoutingLogic)?
    
    let tableView = UITableView()
    
    private var cryptoNewsViewModel = CryptoNewsViewModel.init(cell: [])
    var dataFetcher = DataFetcherService()
    
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
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.identifier)
        
        interactor?.makeRequest(request: CryptoNews.Model.Request.RequestType.getCoins)
        print("viewDidLoad")
    }
    
    func displayData(viewModel: CryptoNews.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayCoins(let cryptoViewModel):
            self.cryptoNewsViewModel = cryptoViewModel
            tableView.reloadData()
        }
    }
}
extension CryptoNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoNewsViewModel.cell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier, for: indexPath) as? CryptoCell else { return UITableViewCell() }
        let cellViewModel = cryptoNewsViewModel.cell[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }
    
    
    
    
}

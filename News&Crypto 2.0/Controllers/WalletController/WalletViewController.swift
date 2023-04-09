import UIKit

protocol WalletDisplayLogic: AnyObject
{
    func displaySomething(viewModel: Wallet.Something.ViewModel)
}

class WalletViewController: UIViewController, WalletDisplayLogic
{
    var interactor: WalletBusinessLogic?
    var router: (NSObjectProtocol & WalletRoutingLogic & WalletDataPassing)?
    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = WalletInteractor()
        let presenter = WalletPresenter()
        let router = WalletRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        var dataFetcher = DataFetcherService()
        dataFetcher.getCoins { coin in
            if let coin = coin {
                print(coin)
            }
        }
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = Wallet.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Wallet.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}

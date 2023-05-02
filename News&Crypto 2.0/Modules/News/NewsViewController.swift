import UIKit

protocol NewsDisplayLogic: AnyObject {
  func displayData(viewModel: News.Model.ViewModel.ViewModelData)
}

class NewsViewController: UIViewController, NewsDisplayLogic {

  var interactor: NewsBusinessLogic?
  var router: (NSObjectProtocol & NewsRoutingLogic)?

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
    let interactor            = NewsInteractor()
    let presenter             = NewsPresenter()
    let router                = NewsRouter()
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
  }
  
  func displayData(viewModel: News.Model.ViewModel.ViewModelData) {

  }
  
}

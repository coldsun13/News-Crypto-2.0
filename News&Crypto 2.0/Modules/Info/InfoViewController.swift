import UIKit

protocol InfoDisplayLogic: AnyObject {
  func displayData(viewModel: Info.Model.ViewModel.ViewModelData)
}

class InfoViewController: UIViewController, InfoDisplayLogic {

  var interactor: InfoBusinessLogic?
  var router: (NSObjectProtocol & InfoRoutingLogic)?

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
    let interactor            = InfoInteractor()
    let presenter             = InfoPresenter()
    let router                = InfoRouter()
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
  
  func displayData(viewModel: Info.Model.ViewModel.ViewModelData) {

  }
  
}

import UIKit

@objc protocol WalletRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol WalletDataPassing
{
  var dataStore: WalletDataStore? { get }
}

class WalletRouter: NSObject, WalletRoutingLogic, WalletDataPassing
{
  weak var viewController: WalletViewController?
  var dataStore: WalletDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: WalletViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: WalletDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}

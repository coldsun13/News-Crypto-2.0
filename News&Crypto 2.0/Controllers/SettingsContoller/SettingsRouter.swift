import UIKit

@objc protocol SettingsRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SettingsDataPassing
{
  var dataStore: SettingsDataStore? { get }
}

class SettingsRouter: NSObject, SettingsRoutingLogic, SettingsDataPassing
{
  weak var viewController: SettingsViewController?
  var dataStore: SettingsDataStore?

}

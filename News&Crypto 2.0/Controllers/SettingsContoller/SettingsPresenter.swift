import UIKit

protocol SettingsPresentationLogic {
  func presentData(response: Settings.Model.Response.ResponseType)
}

class SettingsPresenter: SettingsPresentationLogic {
  weak var viewController: SettingsDisplayLogic?
  
  func presentData(response: Settings.Model.Response.ResponseType) {
  
  }
  
}

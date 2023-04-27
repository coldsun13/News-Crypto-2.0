import UIKit

protocol InfoPresentationLogic {
  func presentData(response: Info.Model.Response.ResponseType)
}

class InfoPresenter: InfoPresentationLogic {
  weak var viewController: InfoDisplayLogic?
  
  func presentData(response: Info.Model.Response.ResponseType) {
  
  }
  
}

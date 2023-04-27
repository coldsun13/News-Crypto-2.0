import UIKit

protocol InfoBusinessLogic {
  func makeRequest(request: Info.Model.Request.RequestType)
}

class InfoInteractor: InfoBusinessLogic {

  var presenter: InfoPresentationLogic?
  var service: InfoService?
  
  func makeRequest(request: Info.Model.Request.RequestType) {
    if service == nil {
      service = InfoService()
    }
  }
  
}

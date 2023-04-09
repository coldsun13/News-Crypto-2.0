//
//  InfoInteractor.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 9.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

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

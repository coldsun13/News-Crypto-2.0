//
//  SettingsInteractor.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 9.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SettingsBusinessLogic {
  func makeRequest(request: Settings.Model.Request.RequestType)
}

class SettingsInteractor: SettingsBusinessLogic {

  var presenter: SettingsPresentationLogic?
  var service: SettingsService?
  
  func makeRequest(request: Settings.Model.Request.RequestType) {
    if service == nil {
      service = SettingsService()
    }
  }
  
}

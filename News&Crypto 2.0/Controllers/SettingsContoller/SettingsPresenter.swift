//
//  SettingsPresenter.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 9.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SettingsPresentationLogic {
  func presentData(response: Settings.Model.Response.ResponseType)
}

class SettingsPresenter: SettingsPresentationLogic {
  weak var viewController: SettingsDisplayLogic?
  
  func presentData(response: Settings.Model.Response.ResponseType) {
  
  }
  
}

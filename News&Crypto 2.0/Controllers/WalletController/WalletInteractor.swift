//
//  WalletInteractor.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 9.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol WalletBusinessLogic {
  func makeRequest(request: Wallet.Model.Request.RequestType)
}

class WalletInteractor: WalletBusinessLogic {

  var presenter: WalletPresentationLogic?
  var service: WalletService?
  
  func makeRequest(request: Wallet.Model.Request.RequestType) {
    if service == nil {
      service = WalletService()
    }
  }
  
}

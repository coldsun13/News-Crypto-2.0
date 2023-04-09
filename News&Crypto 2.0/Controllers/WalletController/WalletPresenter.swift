//
//  WalletPresenter.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 9.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol WalletPresentationLogic {
  func presentData(response: Wallet.Model.Response.ResponseType)
}

class WalletPresenter: WalletPresentationLogic {
  weak var viewController: WalletDisplayLogic?
  
  func presentData(response: Wallet.Model.Response.ResponseType) {
  
  }
  
}

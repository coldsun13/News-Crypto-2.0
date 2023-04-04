//
//  CryptoNewsInteractor.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 3.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoNewsBusinessLogic {
  func makeRequest(request: CryptoNews.Model.Request.RequestType)
}

class CryptoNewsInteractor: CryptoNewsBusinessLogic {
    
    var presenter: CryptoNewsPresentationLogic?
    var service: CryptoNewsService?
    
    func makeRequest(request: CryptoNews.Model.Request.RequestType) {
        if service == nil {
            service = CryptoNewsService()
        }
        
        switch request {
        case .some:
            print("some")
        case .getCoins:
            presenter?.presentData(response: .presentCoins)
        }
        
    }
}

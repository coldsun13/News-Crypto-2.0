//
//  CoinInteractor.swift
//  News&Crypto
//
//  Created by Игорь Тимофеев on 22.10.23.
//

import UIKit

protocol CoinInteractorProtocol {
    func fetchTap()
}

final class CoinInteractor: CoinInteractorProtocol {
    
    var service: CoinWorker?
    var presenter: CoinPresenterProtocol?
    
    func fetchTap() {
        print("интерактор")
        presenter?.didTap()
    }
    
    
    init(service: CoinWorker) {
        self.service = service
    }
}

//
//  CoinAssembly.swift
//  News&Crypto
//
//  Created by Игорь Тимофеев on 22.10.23.
//

import UIKit

final class CoinAssembly {
    
    static func assemblyCoin() -> UIViewController {
        var view = CoinController()
        var service = CoinWorker()
        var interactor = CoinInteractor(service: service)
        var presenter = CoinPresenter()
        var router = CoinRouter()
        
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.viewController = view
        router.viewController = view
        
        return view
    }
    
}

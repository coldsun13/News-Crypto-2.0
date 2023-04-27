//
//  NewsViewController.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 22.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsDisplayLogic: class {
  func displayData(viewModel: News.Model.ViewModel.ViewModelData)
}

class NewsViewController: UIViewController, NewsDisplayLogic {

  var interactor: NewsBusinessLogic?
  var router: (NSObjectProtocol & NewsRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = NewsInteractor()
    let presenter             = NewsPresenter()
    let router                = NewsRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: News.Model.ViewModel.ViewModelData) {

  }
  
}

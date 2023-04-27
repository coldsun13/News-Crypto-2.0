//
//  NewsPresenter.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 22.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsPresentationLogic {
  func presentData(response: News.Model.Response.ResponseType)
}

class NewsPresenter: NewsPresentationLogic {
  weak var viewController: NewsDisplayLogic?
  
  func presentData(response: News.Model.Response.ResponseType) {
  
  }
  
}

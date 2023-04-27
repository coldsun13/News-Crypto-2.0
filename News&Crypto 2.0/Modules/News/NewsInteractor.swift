//
//  NewsInteractor.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 22.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsBusinessLogic {
  func makeRequest(request: News.Model.Request.RequestType)
}

class NewsInteractor: NewsBusinessLogic {

  var presenter: NewsPresentationLogic?
  var service: NewsService?
  
  func makeRequest(request: News.Model.Request.RequestType) {
    if service == nil {
      service = NewsService()
    }
  }
  
}

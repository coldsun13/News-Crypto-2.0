//
//  CryptoNewsModels.swift
//  News&Crypto 2.0
//
//  Created by Игорь Тимофеев on 3.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum CryptoNews {
    
    enum Model {
        struct Request {
            enum RequestType {
                case some
                case getCoins
            }
        }
        struct Response {
            enum ResponseType {
                case some
                case presentCoins
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case some
                case displayCoins
            }
        }
    }
    
}

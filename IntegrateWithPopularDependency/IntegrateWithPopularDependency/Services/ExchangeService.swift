//
//  ExchangeService.swift
//  IntegrateWithPopularDependency
//
//  Created by Introdex on 6/1/2563 BE.
//  Copyright © 2563 Introdex. All rights reserved.
//

import Foundation
import Alamofire

class ExchangeServiceModel {
    
    enum FetchExchanges {
        struct Request {
            
        }
        
        enum Response {
            struct Success {
                let exchanges: [Exchange]
            }
            struct Failure {
                let error: String
            }
     
        }
    }
    
}
    
protocol ExchangeServiceProtocol {
    func fetchExchanges(completionHandler: @escaping (ExchangeServiceModel.FetchExchanges.Response.Success) -> (),
                        failureHandler: @escaping (ExchangeServiceModel.FetchExchanges.Response.Failure) -> ())
}

final class ExchangeService: ExchangeServiceProtocol {
        
    func fetchExchanges(completionHandler: @escaping (ExchangeServiceModel.FetchExchanges.Response.Success) -> (),
                        failureHandler: @escaping (ExchangeServiceModel.FetchExchanges.Response.Failure) -> ()) {
        //exchange_list.json
        AF.request("https://httpbin.org/get")
            .responseJSON { response in
            debugPrint(response)
        }
        
    }
}

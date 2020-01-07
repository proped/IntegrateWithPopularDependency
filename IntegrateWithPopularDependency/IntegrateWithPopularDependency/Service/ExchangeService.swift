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
        }
    }
    
}
    
protocol ExchangeServiceProtocol {
    func fetchExchanges(completionHandler: @escaping (ExchangeServiceModel.FetchExchanges.Response.Success) -> ())
}

final class ExchangeService: ExchangeServiceProtocol {
        
    func fetchExchanges(completionHandler: @escaping (ExchangeServiceModel.FetchExchanges.Response.Success) -> ()) {
        
        // url of example json file
        let jsonURL = "https://api.myjson.com/bins/wtpmg"
        
        // request for json data
        AF.request(jsonURL)
            .responseJSON { response in
                typealias Response = ExchangeServiceModel.FetchExchanges.Response
            
                // json serialization
                guard let jsonObject = try? JSONSerialization.jsonObject(with: response.data!,
                                                                         options: []),
                    let json = jsonObject as? [Any?] else {
                    completionHandler(Response.Success(exchanges: []))
                    return
                }
                                
                // mappnig model to array
                let exchanges: [Exchange] = json.compactMap({ (any) -> Exchange? in
                    guard let any = any,
                        let exchange = try? Exchange(JSONObject: any)
                        else { return nil }
                    return exchange
                })
                completionHandler(Response.Success(exchanges: exchanges))
                return
        }
        
    }
}

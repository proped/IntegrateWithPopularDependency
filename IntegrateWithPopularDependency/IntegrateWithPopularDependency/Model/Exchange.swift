//
//  Exchange.swift
//  IntegrateWithPopularDependency
//
//  Created by Introdex on 6/1/2563 BE.
//  Copyright © 2563 Introdex. All rights reserved.
//

import Foundation
import ObjectMapper

class Exchange: ImmutableMappable, Identifiable {
    
    let symbol: String
    let name: String
    let id: Int
    
    required init(map: Map) throws {
        symbol = try map.value("symbol")
        name = try map.value("name")
        id = try map.value("id")
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    init(symbol: String,
         name: String,
         id: Int) {
        self.symbol = symbol
        self.name = name
        self.id = id
    }
 
    static func == (lhs: Exchange,
                    rhs: Exchange) -> Bool {
        return lhs.id == rhs.id
    }
    
}


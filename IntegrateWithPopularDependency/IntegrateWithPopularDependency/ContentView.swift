//
//  ContentView.swift
//  IntegrateWithPopularDependency
//
//  Created by Introdex on 6/1/2563 BE.
//  Copyright © 2563 Introdex. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var exchanges: [Exchange] = [Exchange(symbol: "Please Tap",
                                                 name: "Fetch Button",
                                                 id: 9)]
    
    var body: some View {
        VStack {
            Spacer(minLength: 20)
            Button(
                action: { self.fetch() },
                label: { Text("Fetch") }
            )
            Spacer(minLength: 20)
            Text("Stock Exchange List").bold()
            List(exchanges, id: \.id) { (exchange) in
                Text("\(exchange.symbol) : \(exchange.name)")
            }
        }
    }
    
    func reloadView(exchanges: [Exchange]) {
        self.exchanges = exchanges        
    }
    
    func fetch() {
        ExchangeService()
            .fetchExchanges(completionHandler: { (response) in
                print("fetch data completed.")
                self.reloadView(exchanges: response.exchanges)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

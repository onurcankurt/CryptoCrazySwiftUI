//
//  ContentView.swift
//  CryptoCrazySUI
//
//  Created by onur on 6.12.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init(){
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationStack{
            
            List(cryptoListViewModel.cryptoList, id:\.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundStyle(.blue)
                        
                    Text(crypto.price)
                        .foregroundStyle(.black)
                }
            }.navigationTitle(Text("Crypto Crazy"))
        }.onAppear() {
            cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
}

#Preview {
    MainView()
}

//
//  CryptoViewModel.swift
//  CryptoCrazySUI
//
//  Created by onur on 6.12.2023.
//

import Foundation

// https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    func downloadCryptos(url : URL) {
        
        webservice.downloadCurrencies(url: url) { result in
            
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }
}


struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
    
}

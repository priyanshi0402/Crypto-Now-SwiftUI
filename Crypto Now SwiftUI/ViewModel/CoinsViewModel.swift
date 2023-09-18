//
//  CoinsViewModel.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coinData: [CoinExchangeResponse] = []
    
    init() {
        Task {
            await fetchCoinData()
        }
    }
    
    func fetchCoinData() async {
        do {
            let data = try await APIManager.shared.fetchDatas(from: "https://api.coindcx.com/exchange/ticker", responseType: [CoinExchangeResponse].self)
            DispatchQueue.main.async {
                self.coinData = data
            }
        } catch {
            print(error)
        }
    }
}

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
        guard let url = URL(string: "https://api.coindcx.com/exchange/ticker") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([CoinExchangeResponse].self, from: data)
            DispatchQueue.main.async {
                self.coinData = Array(decodedResponse.prefix(20))
            }
        } catch {
            print(error)
        }
    }
}

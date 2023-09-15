//
//  HomeVC.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 14/09/23.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @ObservedObject var coinModel = CoinsViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "TextColor") as Any]
        UINavigationBar.appearance().backgroundColor = UIColor(named: "BgColor")
    }
    
    var body: some View {
            NavigationView { // Make sure your ContentView is wrapped in a NavigationView
                ScrollView() {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 15), count: 2)) {
                        ForEach(coinModel.coinData, id: \.market) { coin in
                            CurrencyRateCell(coin: coin)
                        }
                    }
                }
                .padding([.trailing, .leading], 15)
                .background(Color("BgColor"))
                .navigationTitle("Currency Rate")
            }
        }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CurrencyRateCell: View {
    var coin: CoinExchangeResponse
    var body: some View {
        let change_24_hour = coin.change_24_hour ?? ""
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    let uiImage = UIImage(named: coin.market)
                    Image(uiImage: (uiImage == nil ? UIImage(named: "Default") : uiImage) ?? UIImage())
                        .resizable()
                        .frame(width: 44, height: 44)
                        .cornerRadius(22)
                    VStack(alignment: .leading) {
                        Text(coin.market)
                            .font(.headline)
                            .lineLimit(1)
                        Text("INR")
                    }
                    Spacer()
                }
                HStack {
                    
                    Text(coin.change_24_hour ?? "")
                        .lineLimit(1)
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .background((change_24_hour.contains("-") ? Color("Red") : Color("Green")).opacity(0.50))
                        .cornerRadius(15)
                    Image(systemName: change_24_hour.contains("-") ? "arrow.up.right.circle.fill" : "arrow.down.right.circle.fill")
                        .foregroundColor(change_24_hour.contains("-") ? Color("Red") : Color("Green") )
                    Spacer()
                }
                HStack {
                    Text(coin.last_price ?? "")
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                }
            }
            .padding(16)
        }
        .background((change_24_hour.contains("-") ? Color("Red") : Color("Green")).opacity(0.20))
        .cornerRadius(12)
        .padding(.bottom, 10)
        
    }
}

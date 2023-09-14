//
//  CurrencyViewModel.swift
//  Crypto Now SwiftUI
//
//  Created by Priyanshi Bhikadiya on 13/09/23.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    
    static let shared = CurrencyViewModel()
    
    @Published var followsData: [CurrencyModel] = [ CurrencyModel(newsId: UUID().uuidString, title: "CoinTelegraph", image: "CoinTelegraph", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Capital", image: "Capital", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "CNN", image: "CNN", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Bravenewcoin", image: "Bravenewcoin", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Blockonomi", image: "Blockonomi", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Blockchain", image: "Blockchain", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Bitcoinmagazine", image: "Bitcoinmagazine", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Bitcoinist", image: "Bitcoinist", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Bitcoin", image: "Bitcoin", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Beincrypto", image: "Beincrypto", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Ambcrypto", image: "Ambcrypto", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "99bitcoins", image: "99bitcoins", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Zycrypto", image: "Zycrypto", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Utoday", image: "Utoday", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Todayonchain", image: "Todayonchain", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Time", image: "Time", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Ripplecoinnews", image: "Ripplecoinnews", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Null Tx", image: "Null Tx", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "NewsBTC", image: "NewsBTC", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Moneycontrol", image: "Moneycontrol", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Investing", image: "Investing", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Investinblockchain", image: "Investinblockchain", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Gestion", image: "Gestion", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Forbes", image: "Forbes", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Finextra", image: "Finextra", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "FT", image: "FT", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Dailycoin", image: "Dailycoin", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptovest", image: "Cryptovest", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptopotato", image: "Cryptopotato", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptopanic", image: "Cryptopanic", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptonewsz", image: "Cryptonewsz", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptonews", image: "Cryptonews", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptonaute", image: "Cryptonaute", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptobriefing", image: "Cryptobriefing", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Cryptoast", image: "Cryptoast", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "CryptoSlate", image: "CryptoSlate", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Coinspeaker", image: "Coinspeaker", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Coinquora", image: "Coinquora", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Coinpedia", image: "Coinpedia", isFollow: false),
                                                      CurrencyModel(newsId: UUID().uuidString, title: "Coindesk", image: "Coindesk", isFollow: false),
                                                     
                                          ]
    
    
    func toogleFollow(data: CurrencyModel) {
        if let index = followsData.firstIndex(where: { $0.newsId == data.newsId }) {
            followsData[index].isFollow.toggle()
        }
    }
    
}

//
//  FollowCurrencyView.swift
//  Crypto Now SwiftUI
//
//  Created by Priyanshi Bhikadiya on 12/09/23.
//

import SwiftUI

struct FollowCurrencyView: View {
    
    @StateObject fileprivate var viewModel = NewsFollowData()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(
                    viewModel.followsData, id: \.newsId) { news in
                    HStack {
                        VStack {
                            Image(news.image)
                                .resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        .frame(width: 40, height: 40, alignment: .center)
                        Text(news.title)
                            .foregroundColor(Color.white)
                        Spacer()
                        Button {
                            viewModel.toogleFollow(data: news)
                            // news.isFollow = !news.isFollow
                        } label: {
                            Text(news.isFollow ? "Following" : "Follow")
                                .frame(height: 30)
                                .padding([.leading, .trailing], 10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                        }
                    }
                    .listRowBackground(Color("BgColor"))
                    
                }
                .listStyle(.plain)
                .padding(.top, 10)
                
                Button {
                    
                } label: {
                    Text("Continue")
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
            .background(Color("BgColor").edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Follow Currency", displayMode: .inline)
            .onAppear {
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            }
            
        }
        
    }
}

struct FollowCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        FollowCurrencyView()
    }
}

struct NewsFollowModel {
    var newsId: String = ""
    var title : String = ""
    var image : String = ""
    var isFollow : Bool = false

}
 
class NewsFollowData: ObservableObject {
    
    static let shared = NewsFollowData()
    
    @Published var followsData: [NewsFollowModel] = [ NewsFollowModel(newsId: UUID().uuidString, title: "CoinTelegraph", image: "CoinTelegraph", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Capital", image: "Capital", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "CNN", image: "CNN", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Bravenewcoin", image: "Bravenewcoin", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Blockonomi", image: "Blockonomi", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Blockchain", image: "Blockchain", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Bitcoinmagazine", image: "Bitcoinmagazine", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Bitcoinist", image: "Bitcoinist", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Bitcoin", image: "Bitcoin", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Beincrypto", image: "Beincrypto", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Ambcrypto", image: "Ambcrypto", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "99bitcoins", image: "99bitcoins", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Zycrypto", image: "Zycrypto", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Utoday", image: "Utoday", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Todayonchain", image: "Todayonchain", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Time", image: "Time", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Ripplecoinnews", image: "Ripplecoinnews", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Null Tx", image: "Null Tx", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "NewsBTC", image: "NewsBTC", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Moneycontrol", image: "Moneycontrol", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Investing", image: "Investing", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Investinblockchain", image: "Investinblockchain", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Gestion", image: "Gestion", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Forbes", image: "Forbes", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Finextra", image: "Finextra", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "FT", image: "FT", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Dailycoin", image: "Dailycoin", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptovest", image: "Cryptovest", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptopotato", image: "Cryptopotato", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptopanic", image: "Cryptopanic", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptonewsz", image: "Cryptonewsz", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptonews", image: "Cryptonews", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptonaute", image: "Cryptonaute", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptobriefing", image: "Cryptobriefing", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Cryptoast", image: "Cryptoast", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "CryptoSlate", image: "CryptoSlate", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Coinspeaker", image: "Coinspeaker", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Coinquora", image: "Coinquora", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Coinpedia", image: "Coinpedia", isFollow: false),
                                                      NewsFollowModel(newsId: UUID().uuidString, title: "Coindesk", image: "Coindesk", isFollow: false),
                                                     
                                          ]
    
    
    func toogleFollow(data: NewsFollowModel) {
        if let index = followsData.firstIndex(where: { $0.newsId == data.newsId }) {
            followsData[index].isFollow.toggle()
        }
    }
    
}

//
//  FollowCurrencyView.swift
//  Crypto Now SwiftUI
//
//  Created by Priyanshi Bhikadiya on 12/09/23.
//

import SwiftUI

struct FollowCurrencyView: View {
    
    @StateObject fileprivate var viewModel = CurrencyViewModel()
    @State private var isShowTabScreen = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: Colors.textColor) as Any]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.followsData, id: \.newsId) { news in
                    HStack {
                        VStack {
                            Image(news.image)
                                .resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        .frame(width: 40, height: 40, alignment: .center)
                        Text(news.title)
                            .foregroundColor(Color(Colors.textColor))
                        Spacer()
                        Button {
                            viewModel.toogleFollow(data: news)
                        } label: {
                            Text(news.isFollow ? "Following" : "Follow")
                                .frame(height: 30)
                                .padding([.leading, .trailing], 10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                        }
                    }
                    .listRowBackground(Color(Colors.bgColor))
                    
                }
                .listStyle(.plain)
                .padding(.top, 10)
                
                Button {
                    self.isShowTabScreen = true
                } label: {
                    Text("Continue")
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                NavigationLink("", destination: TabbarView(), isActive: $isShowTabScreen)
            }
            .background(Color(Colors.bgColor).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Follow Currency", displayMode: .inline)
//            .navigationBarHidden(true)
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


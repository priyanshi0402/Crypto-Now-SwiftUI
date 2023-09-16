//
//  NewsListView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 16/09/23.
//

import SwiftUI

struct NewsListView: View {
    
    var news: [Article] = []
    @State var selectedCategory: NewsCategory?
    
    var body: some View {
        if news.isEmpty {
            VStack(alignment: .center) {
                ProgressView()
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color(Colors.bgColor))
            
        } else {
            VStack {
                List(news, id: \.publishedAt) { news in
                    NewsCellView(news: news)
                        .listRowBackground(Color(Colors.bgColor))
                }
                .listStyle(.plain)
            }
            .background(Color(Colors.bgColor))
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

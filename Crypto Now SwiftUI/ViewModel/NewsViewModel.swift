//
//  NewsViewModel.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [Article] = []
    
    init() {
        Task {
            await fetchNewsData()
        }
    }
    
    func fetchNewsData(category: NewsCategory = .general) async {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=3f04cdd776cd4a92a58332bbce23ed47&category=\(category.rawValue)") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodeResponse = try JSONDecoder().decode(NewsModel.self, from: data)
            DispatchQueue.main.async {
                self.news = decodeResponse.articles
            }
        } catch {
            print(error)
        }
        
    }
}

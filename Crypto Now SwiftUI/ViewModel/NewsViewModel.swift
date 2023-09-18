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
        do {
            let data: NewsModel = try await APIManager.shared.fetchData(from: "https://newsapi.org/v2/top-headlines?country=in&apiKey=3f04cdd776cd4a92a58332bbce23ed47&category=\(category.rawValue)", responseType: NewsModel.self)
            DispatchQueue.main.async {
                self.news = data.articles
            }
        } catch {
            print(error)
        }
    }
}

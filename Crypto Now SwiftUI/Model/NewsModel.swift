//
//  NewsModel.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
//    var id: String = UUID().uuidString
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

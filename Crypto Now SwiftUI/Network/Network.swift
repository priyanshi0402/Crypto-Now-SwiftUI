//
//  Network.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 18/09/23.
//

import Foundation

fileprivate var apikey = "3f04cdd776cd4a92a58332bbce23ed47"
fileprivate var baseApi = "https://newsapi.org/v2/"

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    
}

class APIManager {
    static let shared = APIManager()
    
    func fetchDatas<T: Decodable>(from url: String, responseType: [T].Type) async throws -> [T] {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            return decodedResponse
        } catch {
            throw APIError.decodingFailed(error)
        }
    }
    
    func fetchData<T: Decodable>(from url: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            return decodedResponse
        } catch {
            throw APIError.decodingFailed(error)
        }
    }
}

//
//  CoinExchangeModel.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import Foundation

struct CoinExchangeResponse : Decodable {
    let market: String
    let change_24_hour: String?
    let high: String?
    let low: String?
    let volume: String?
    let last_price: String?
    let bid: EitherStringOrDouble?
    let ask: EitherStringOrDouble?
    let timestamp: Int?
}

enum EitherStringOrDouble: Decodable {
    case string(String)
    case double(Double)
    
    init(from decoder: Decoder) throws {
        if let container = try? decoder.singleValueContainer(), let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else if let container = try? decoder.singleValueContainer(), let doubleValue = try? container.decode(Double.self) {
            self = .double(doubleValue)
        } else {
            throw DecodingError.dataCorruptedError(in: try decoder.singleValueContainer(), debugDescription: "Expected either String or Double")
        }
    }
}

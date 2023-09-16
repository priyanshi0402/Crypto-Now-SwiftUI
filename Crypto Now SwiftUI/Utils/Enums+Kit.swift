//
//  Enums+Kit.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import Foundation

enum IntroOption: String, CaseIterable, Identifiable {
    case first = "Boost your Crypto related decision"
    case second = "Discover and monitor cryptocurrency related news worldwide"
    case third = "Get the Crypto data within minutes after it is published"
    
    var id: String { rawValue }
    
    var title: String {
        return rawValue
    }
    
    var image: String {
        switch self {
        case .first:
            return "intro_1"
        case .second:
            return "intro_2"
        case .third:
            return "intro_3"
        }
    }
    
    var tag: Int {
        switch self {
        case .first:
            return 0
        case .second:
            return 1
        case .third:
            return 2
        }
    }
    
}

enum NewsCategory: String, CaseIterable, Identifiable {
    case general = "General"
    case business = "Business"
    case entertainment = "Entertainment"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .business:
            return "Business"
        case .entertainment:
            return "Entertainment"
        case .general:
            return "General"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sports:
            return "Sports"
        case .technology:
            return "Technology"
//        case .all:
//            return "All"
        }
    }
    
    var image: String {
        switch self {
        case .business:
            return "briefcase.fill"
        case .entertainment:
            return "tv.fill"
        case .general:
            return "heart.text.square.fill"
        case .health:
            return "stethoscope"
        case .science:
            return "flame.fill"
        case .sports:
            return "sportscourt.fill"
        case .technology:
            return "laptopcomputer"
//        case .all:
//            return "newspaper.fill"
        }
    }
}

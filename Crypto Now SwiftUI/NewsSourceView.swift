//
//  NewsSourceView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsSourceView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: Colors.bgColor)
    }
        
    var body: some View {
        NavigationView {
            VStack {
                
            }
//            NewsListView(news: articals.news)
                .navigationTitle("News")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceView()
    }
}

struct NewsCellView: View {
    var news: Article
    var body: some View {
        HStack(spacing: 10) {
            VStack {
                WebImage(url: URL(string: news.urlToImage ?? ""))
                    .resizable()
                    .placeholder(Image("test_image"))
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
                    .padding(.top, 10)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(news.description ?? "")
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(Color(Colors.secondTextColor))
                HStack {
                    let date = convertStringToDate(str: news.publishedAt ?? "")
                    Text("~ \(news.author ?? news.source.name)")
                        .font(.caption)
                        .lineLimit(3)
                        .foregroundColor(Color(Colors.subTextColor))
                    Spacer()
                    Text(date?.timeAgoDisplay() ?? news.publishedAt ?? "")
                        .font(.caption2)
                        .lineLimit(3)
                        .foregroundColor(Color(Colors.subTextColor))
                }
                
            }
            
        }
    }
}

func convertStringToDate(str: String) -> Date? {
    let dateFormate = ISO8601DateFormatter()
//    dateFormate.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"
    return dateFormate.date(from: str)
}

extension Date {
    func timeAgoDisplay() -> String {
        let calender = Calendar.current
        let minuteAgo = calender.date(byAdding: .minute, value: -1, to: Date())!
        let hourAgo = calender.date(byAdding: .hour, value: -1, to: Date())!
        let dayAgo = calender.date(byAdding: .day, value: -1, to: Date())!
        let weekAgo = calender.date(byAdding: .day, value: -7, to: Date())!
//        let monthAgo = calender.date(byAdding: .month, value: -1, to: Date())!
        
        if minuteAgo < self {
            let diff = calender.dateComponents([.second], from: self, to: Date()).second ?? 0
            return "\(diff) sec ago"
        } else if hourAgo < self {
            let diff = calender.dateComponents([.minute], from: self, to: Date()).minute ?? 0
            return "\(diff) min ago"
        } else if dayAgo < self {
            let diff = calender.dateComponents([.hour], from: self, to: Date()).hour ?? 0
            return "\(diff) hours ago"
        } else if weekAgo < self {
            let diff = calender.dateComponents([.day], from: self, to: Date()).day ?? 0
            return "\(diff) days ago"
        }
        
        let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
        return "\(diff) weeks ago"
    }
}

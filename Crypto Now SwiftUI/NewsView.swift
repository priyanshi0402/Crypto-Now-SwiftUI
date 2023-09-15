//
//  NewsView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import SwiftUI

struct NewsView: View {
    
    var body: some View {
        List {
            NewsCellView()
                .listRowBackground(Color("BgColor"))
            NewsCellView()
                .listRowBackground(Color("BgColor"))
            NewsCellView()
                .listRowBackground(Color("BgColor"))
            NewsCellView()
                .listRowBackground(Color("BgColor"))
            NewsCellView()
                .listRowBackground(Color("BgColor"))
            NewsCellView()
                .listRowBackground(Color("BgColor"))
        }
        .background(Color("BgColor"))
        .listStyle(.plain)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

struct NewsCellView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image("test_image")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    Spacer()
                }
                
                VStack(spacing: 8) {
                    Text("PM Modi's MP Visit LIVE: PM Modi to unveil development projects in Madhya Pradesh and Chhattisgarh, ahead of upcoming elections - Moneycontrol")
                        .font(.headline)
                        .lineLimit(2)
                    Text("2023 Tata Nexon Facelift Launch LIVE: As part of TATA.ev's rebranding efforts, the 2023 Tata Nexon EV is now presented with the stylized name &quot;Nexon.ev.&quot; Stay tuned for more updates.")
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundColor(Color("SecondTextColor"))
                    HStack {
                        let date = convertStringToDate(str: "2023-09-14T03:03:53Z")
                        Text("~ PINKVILLA")
                            .font(.caption)
                            .lineLimit(3)
                            .foregroundColor(Color("SubTextColor"))
                        Spacer()
                        Text(date?.timeAgoDisplay() ?? "2023-09-14T03:03:53Z")
                            .font(.caption2)
                            .lineLimit(3)
                            .foregroundColor(Color("SubTextColor"))
                    }
                    
                }
                
            }
            
        }
//        .background(Color("BgColor"))
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

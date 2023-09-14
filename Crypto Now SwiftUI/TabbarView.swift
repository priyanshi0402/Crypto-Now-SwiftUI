//
//  TabbarView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 14/09/23.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection = 0 // Initialize with the default selected tab
    
    var body: some View {
        //        VStack {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: selection == 0 ? "house.fill" : "house")
                    Text("Home")
                }
                .tag(0)
            Text("Tab 2")
                .tabItem {
                    Image(systemName: selection == 1 ? "newspaper.fill" : "newspaper")
                    Text("News")
                }
                .tag(1)
            Text("Tab 3")
                .tabItem {
                    Image(systemName: selection == 2 ? "doc.append.fill.rtl" : "doc.append.rtl")
                    Text("Feed")
                }
                .tag(2)
            Text("Tab 4")
                .tabItem {
                    Image(systemName: selection == 3 ? "gearshape.fill" : "gearshape")
                    Text("Settings")
                }
                .tag(3)
        }
        .background(Color("BgColor"))
        .navigationBarHidden(true)
        //        }
        
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

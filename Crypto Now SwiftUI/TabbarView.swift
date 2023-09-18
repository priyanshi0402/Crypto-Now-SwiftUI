//
//  TabbarView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 14/09/23.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: Colors.bgColor)
        UITabBar.appearance().barTintColor = UIColor(named: Colors.bgColor)
    }

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: selection == 0 ? "house.fill" : "house")
                    Text("Home")
                }
            NewsCategoryView()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("Headlines")
                }
            NewsSourceView()
                .tabItem {
                    Image(systemName: selection == 1 ? "newspaper.fill" : "newspaper")
                    Text("News Source")
                }
           
            Text("Tab 4")
                .tabItem {
                    Image(systemName: selection == 3 ? "gearshape.fill" : "gearshape")
                    Text("Settings")
                }
        }
        
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}



struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

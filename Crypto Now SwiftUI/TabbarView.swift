//
//  TabbarView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 14/09/23.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection = 0
    @State private var tappedTwice: Bool = false
    
    var handler: Binding<Int> { Binding(
        get: { self.selection },
        set: {
            if $0 == self.selection {
                // Lands here if user tapped more than once
                tappedTwice = true
            }
            self.selection = $0
        }
    )}
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: Colors.bgColor)
        UITabBar.appearance().barTintColor = UIColor(named: Colors.bgColor)
    }

    var body: some View {
        ScrollViewReader { proxy in
            TabView(selection: handler) {
                HomeView()
                    .onChange(of: self.tappedTwice, perform: { tapped in
                        if tapped {
                            withAnimation {
                                proxy.scrollTo(1)
                            }
                            tappedTwice = false
                        }
                    })
                    .tabItem {
                        Image(systemName: selection == 0 ? "house.fill" : "house")
                        Text("Home")
                    }
                    .tag(1)
                NewsCategoryView()
                    .tabItem {
                        Image(systemName: "flame.fill")
                        Text("Headlines")
                    }
                    .tag(2)
                NewsSourceView()
                    .tabItem {
                        Image(systemName: selection == 1 ? "newspaper.fill" : "newspaper")
                        Text("News Source")
                    }
                    .tag(3)
                
                Text("Tab 4")
                    .tabItem {
                        Image(systemName: selection == 3 ? "gearshape.fill" : "gearshape")
                        Text("Settings")
                    }
                    .tag(4)
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

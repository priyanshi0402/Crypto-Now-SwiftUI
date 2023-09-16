//
//  ContentView.swift
//  Crypto Now SwiftUI
//
//  Created by Priyanshi Bhikadiya on 10/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            FollowCurrencyView()
        }
        .background(Color(Colors.bgColor))
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

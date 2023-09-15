//
//  IntroView.swift
//  Crypto Now SwiftUI
//
//  Created by Priyanshi Bhikadiya on 10/09/23.
//

import SwiftUI

struct IntroView: View {
    private var introArray: [IntroOption] = IntroOption.allCases
    @State private var currentPage = 0
    @State private var isShowFollowView = false
    private let dotAppearance = UIPageControl.appearance()
    //    var scrollPoxy: ScrollViewProxy!
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(introArray) { page in
                        VStack {
                            OnboardingView(imageName: page.image, title: page.title)
                            Spacer()
                            Button {
                                if page == introArray.last {
                                    isShowFollowView = true
                                } else {
                                    currentPage += 1
                                }
                            } label: {
                                Text("Next")
                                    .frame(width: 300, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                            }
                            .padding(.bottom, 100)
                            NavigationLink("", destination: FollowCurrencyView()
                                .navigationBarBackButtonHidden(true), isActive: $isShowFollowView)
                               
           
                        }
                        .tag(page.tag)
                        
                    }
                }
                .background(Color("BgColor"))
                .animation(.easeInOut, value: currentPage)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .tabViewStyle(.page)
                .onAppear {
                    dotAppearance.currentPageIndicatorTintColor = UIColor(named: "TextColor")
                    dotAppearance.pageIndicatorTintColor = .gray
                }
                
            }
            .ignoresSafeArea()
        }
        
    }
    
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

struct OnboardingView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("TextColor"))
                .padding(.leading)
            
            Image(imageName)
                .resizable()
                .padding(30)
                .scaledToFit()
            
            Spacer()
            
        }
        .padding(.top)
       
    }
    
}

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

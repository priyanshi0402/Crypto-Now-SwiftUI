//
//  NewsCategoryView.swift
//  Crypto Now SwiftUI
//
//  Created by SARVADHI on 15/09/23.
//

import SwiftUI

struct NewsCategoryView: View {
    var categories: [NewsCategory] = NewsCategory.allCases
    @State private var selectedCategory: NewsCategory?
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        CategoryItemView(category: category)
                            .onTapGesture {
                                self.selectedCategory = category
                            }
                    }
                }
                .padding(16)
            }
            .frame(height: 100)
            NewsListView(news: self.viewModel.news)
            Spacer()
        }
        .onChange(of: selectedCategory, perform: { newValue in
            Task {
                await self.viewModel.fetchNewsData(category: newValue ?? .general)
            }
           
        })
        .onAppear {
            Task {
                await self.viewModel.fetchNewsData(category: .general)
            }
        }
        .background(Color(Colors.bgColor))
        
    }
}

struct NewsCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoryView()
    }
}

struct CategoryItemView: View {
    var category: NewsCategory
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                VStack {
                    Image(systemName: category.image)
                        .imageScale(.large)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Colors.textColor))
                    
                }
                .frame(width: 56, height: 56)
                .background(Color.secondary)
                .cornerRadius(28)
                Text(category.title)
                    .lineLimit(1)
                
            }
        }
    }
}

//
//  SpotifyHomeView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI
import SwiftfulUI
struct SpotifyHomeView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        recentSection
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        headerView
                    }

                }
                .padding(.top, 8)
            }
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            
        }
    }
}

extension SpotifyHomeView {
    private var headerView : some View {
        HStack(spacing: 0){
            ZStack{
                if let currentUser {
                    ImageLoaderView()
                        .background(.spWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("Profile View Tapped")
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView (.horizontal){
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCatagoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spBlack)
        
    }
    
    private var recentSection : some View {
        VStack{
            NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
                if let product {
                    SpotifyRecentCells(imageName: product.firstImage, title: product.title)
                }
            }
        }
    }
}

#Preview {
    SpotifyHomeView()
}

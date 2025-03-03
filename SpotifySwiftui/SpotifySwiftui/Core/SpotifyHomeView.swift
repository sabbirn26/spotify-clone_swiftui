//
//  SpotifyHomeView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
            VStack{
                headerView
                Spacer()
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
//            products = try await DatabaseHelper().getProducts()
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
    }
}

#Preview {
    SpotifyHomeView()
}

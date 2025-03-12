//
//  SpotifyHomeView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    // State variables to manage user, selected category, products, and product rows
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    @Environment(\.router) var router // Router environment variable for navigation
    
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea() // Background color for the entire view
            ScrollView(.vertical){
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack{
                            recentSection
                                .padding(.horizontal, 16)
                            
                            if let product = products.first {
                                newReleasedSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            productSection
                        }
                    } header: {
                        headerView // Sticky header section
                    }
                }
                .padding(.top, 8)
            }
            .clipped()
        }
        .task {
            await getData() // Fetch data asynchronously
        }
        .toolbar(.hidden, for: .navigationBar) // Hide navigation bar
    }
    
    private func getData() async {
        guard products.isEmpty else { return } // Prevent multiple API calls
        do {
            // Fetch current user and products from database
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0._brand })) // Extract unique brands
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
                
                productRows = rows // Update product rows
            }
        } catch {
            // Handle errors
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
                            print("Profile View Tapped") // Handle profile tap
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView (.horizontal){
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \..self) { category in
                        SpotifyCatagoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category // Update selected category
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spBlack) // Set background color for header
    }
    
    private var recentSection : some View {
        VStack{
            // Grid layout for displaying recent products
            NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
                if let product {
                    SpotifyRecentCells(imageName: product.firstImage, title: product.title)
                        .asButton(.press) {
                            goToPlayListView(product: product) // Navigate to playlist view
                        }
                }
            }
        }
    }
    
    private var productSection : some View {
        // Display products categorized in rows
        ForEach(productRows) { row in
            VStack(spacing: 8){
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal){
                    HStack(alignment: .top, spacing: 16){
                        ForEach(row.products) { product in
                            ImageTitleRowCell(imageName: product.firstImage, imageSize: 120, title: product.title)
                                .asButton(.press) {
                                    goToPlayListView(product: product) // Navigate to playlist
                                }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private func goToPlayListView(product: Product) {
        guard let currentUser else { return } // Ensure user is available
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: currentUser) // Navigate to playlist view
        }
    }
    
    private func newReleasedSection(product: Product) -> some View {
        // Display newly released product section
        SpotifyNewReleasedCell(imageName: product.firstImage, headline: product.brand, subheadline: product.category, title: product.title, subtitle: product.description, addtoPlayListBtnAction: {
            
        }, playThePlayListBtnAction: {
            goToPlayListView(product: product)
        })
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
}

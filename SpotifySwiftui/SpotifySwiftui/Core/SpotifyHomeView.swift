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
    @State private var productRows: [ProductRow] = []
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
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
                            
                            productRowsSection
                        }
                        
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
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0._brand }))
            for brand in allBrands {
                //                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand.capitalized, products: products))
                
                productRows = rows
            }
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
    
    private var productRowsSection : some View {
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
                        }
                    }
                }
                .padding(.horizontal, 16)
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private func newReleasedSection(product: Product) -> some View {
        SpotifyNewReleasedCell(imageName: product.firstImage, headline: product.brand, subheadline: product.category, title: product.title, subtitle: product.description, addtoPlayListBtnAction: {
            
        }, playThePlayListBtnAction: {
            
        })
    }
}

#Preview {
    SpotifyHomeView()
}

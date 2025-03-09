//
//  SpotifyPlaylistView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 5/3/25.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlayListHeaderCell(height: 250, title: product.title, subtitle: product.brand ?? "", imageName: product.thumbnail)
                    
                    PlayListDesCell(
                        descriptionText: product.description,
                        crUserName: user.lastName,
                        subheadline: product.category) {
                            //code here
                        } onDownloadPressed: {
                            //code here
                        } onSharePressed: {
                            //code here
                        } onElipsisPressed: {
                            //code here
                        } onSufflePressed: {
                            //code here
                        } onPlayPressed: {
                            //code here
                        }
                        .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        SongRowCell(imageName: product.firstImage, imageSize: 100, cellTitle: product.title, cellSubtitle: product.brand) {
                            //code here
                        } onEllipsisPressed: {
                            //code here
                        }

                    }
                    .padding(.leading, 16)

                }
                
            }
            .scrollIndicators(.hidden)
            if true {
                ZStack{
                    Text(product.title)
                        .font(.headline)
                        .foregroundStyle(.spWhite)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                    
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .padding(10)
                        .background(.spGray.opacity(0.7))
                        .clipShape(Circle())
                        .onTapGesture {
                            //code here
                        }
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(.blue)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}

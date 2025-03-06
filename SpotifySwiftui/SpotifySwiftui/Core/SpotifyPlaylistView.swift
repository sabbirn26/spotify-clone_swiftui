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

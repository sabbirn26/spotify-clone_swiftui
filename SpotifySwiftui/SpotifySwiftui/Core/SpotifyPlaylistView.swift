//
//  SpotifyPlaylistView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 5/3/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    var user: User = .mock
    
    @State private var showHeader: Bool = true
    @State private var products: [Product] = []
    
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            Color.spBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    // Playlist header section
                    PlayListHeaderCell(height: 250, title: product.title, subtitle: product.brand ?? "", imageName: product.thumbnail)
                        .readingFrame { frame in
                            showHeader = frame.maxY < 150 ? true : false
                        }
                    
                    // Playlist description and actions
                    PlayListDesCell(
                        descriptionText: product.description,
                        crUserName: user.lastName,
                        subheadline: product.category) {
                            // Handle custom action
                        } onDownloadPressed: {
                            // Handle download action
                        } onSharePressed: {
                            // Handle share action
                        } onElipsisPressed: {
                            // Handle more options action
                        } onSufflePressed: {
                            // Handle shuffle action
                        } onPlayPressed: {
                            // Handle play action
                        }
                        .padding(.horizontal, 16)
                    
                    // Song list section
                    ForEach(products) { product in
                        SongRowCell(imageName: product.firstImage, imageSize: 100, cellTitle: product.title, cellSubtitle: product.brand) {
                            goToSongView(product: product)
                        } onEllipsisPressed: {
                            // Handle more options for song
                        }
                    }
                    .padding(.leading, 16)
                }
            }
            .scrollIndicators(.hidden)
            
            // Floating header title and back button
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.spWhite)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.spBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity(showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? .spBlack.opacity(0.001) : .spGray.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(.spWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationBarBackButtonHidden()
        .task {
            await getData()
        }
    }
    
    // Fetch products data
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            // Handle error
        }
    }
}

extension SpotifyPlaylistView {
    // Navigate to song details view
    private func goToSongView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}


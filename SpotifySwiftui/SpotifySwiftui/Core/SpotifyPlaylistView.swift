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
    @State private var showHeader : Bool = true
    @State private var products: [Product] = []
    @Environment(\.router) var router
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlayListHeaderCell(height: 250, title: product.title, subtitle: product.brand ?? "", imageName: product.thumbnail)
                        .readingFrame{ frame in
                            showHeader = frame.maxY < 150 ? true : false
                        }
                    
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
                            goToSongView(product: product)
                        } onEllipsisPressed: {
                            //code here
                        }

                    }
                    .padding(.leading, 16)

                }
                
            }
            .scrollIndicators(.hidden)
                ZStack{
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
                        .background(showHeader ? .spBlack.opacity(0.001):.spGray.opacity(0.7))
                        .clipShape(Circle())
                        .onTapGesture {
                            //code here
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
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

extension SpotifyPlaylistView {
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

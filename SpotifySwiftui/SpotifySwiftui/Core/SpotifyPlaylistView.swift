//
//  SpotifyPlaylistView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 5/3/25.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlayListHeaderCell(height: 250, title: product.title, subtitle: product.brand ?? "", imageName: product.thumbnail)
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}

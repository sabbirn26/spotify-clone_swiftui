//
//  PlayListHeaderCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 5/3/25.
//

import SwiftUI

struct PlayListHeaderCell: View {
    var height: CGFloat = 300  // Default height for the header
    var title: String = "This is the demo title"  // Playlist title
    var subtitle: String = "This is the demo subtitle"  // Playlist subtitle
    var imageName: String = Constants.randomImage  // Image URL for the header
    var shadowColor: Color = .spBlack.opacity(0.8)  // Shadow overlay color

    var body: some View {
        Rectangle()
            .opacity(0) // Invisible rectangle to maintain structure
            .overlay {
                ImageLoaderView(urlString: imageName) // Loads and displays the playlist image
            }
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    // Subtitle text
                    Text(subtitle)
                        .font(.headline)
                    
                    // Title text
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spWhite) // White text color
                .padding(16) // Adds padding around text
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns text to the left
                .background(
                    // Gradient overlay for better readability
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ),
                alignment: .bottomLeading // Aligns the text overlay to the bottom left
            )
            .asStretchyHeader(startingHeight: height) // Enables stretchy header effect
    }
}

#Preview {
    ZStack {
        Color.spBlack.ignoresSafeArea() // Background color

        ScrollView {
            PlayListHeaderCell() // Previewing the header cell inside a ScrollView
        }
        .ignoresSafeArea()
    }
}

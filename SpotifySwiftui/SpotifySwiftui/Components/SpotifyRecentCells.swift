//
//  SpotifyRecentCells.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 4/3/25.
//

import SwiftUI

// Represents a recent item cell with an image and a title
struct SpotifyRecentCells: View {
    var imageName: String = Constants.randomImage // Default image
    var title: String = "Some random title" // Default title
    
    var body: some View {
        HStack {
            // Loads and displays an image with a fixed size
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            // Displays the title with styling
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2) // Limits text to two lines
            
            Spacer() // Pushes content to the left
        }
        .padding(.trailing, 8)
        .themeColors(isSelected: false) // Applies default styling
        .frame(maxWidth: .infinity, alignment: .leading)
        .cornerRadius(6) // Rounds the corners
    }
}

// Preview to test how the cells look in different layouts
#Preview {
    ZStack {
        Color.spBlack.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentCells()
                SpotifyRecentCells()
            }
            HStack {
                SpotifyRecentCells()
                SpotifyRecentCells()
            }
        }
    }
}

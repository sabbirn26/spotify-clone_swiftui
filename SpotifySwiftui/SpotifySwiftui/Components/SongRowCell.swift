//
//  SongRowCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 6/3/25.
//

import SwiftUI

struct SongRowCell: View {
    // MARK: - Properties
    
    /// URL string for the song's image
    var imageName = Constants.randomImage
    
    /// Size of the song's image
    var imageSize: CGFloat = 50
    
    /// Title of the song
    var cellTitle: String = "Demo title"
    
    /// Optional subtitle (e.g., artist name or album)
    var cellSubtitle: String? = "Demo Subtitle"
    
    /// Action closure triggered when the cell is tapped
    var onCellPressed: (() -> Void)? = nil
    
    /// Action closure triggered when the ellipsis (more options) button is tapped
    var onEllipsisPressed: (() -> Void)? = nil
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 8) {
            // Song thumbnail image
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            // Song title and subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(cellTitle)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spWhite) // White text for title
                
                // Display subtitle if available
                if let cellSubtitle {
                    Text(cellSubtitle)
                        .font(.callout)
                        .foregroundStyle(.spLightGray) // Light gray subtitle text
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2) // Limit text to two lines
            
            // Ellipsis (more options) button
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spWhite)
                .background(Color.black.opacity(0.001)) // Invisible tap area
                .padding(16)
                .onTapGesture {
                    onEllipsisPressed?() // Trigger more options action
                }
        }
        .background(Color.black.opacity(0.001)) // Invisible tap area for entire row
        .onTapGesture {
            onCellPressed?() // Trigger cell tap action
        }
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.spBlack.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}


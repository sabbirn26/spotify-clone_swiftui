//
//  PlayListDesCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 6/3/25.
//

import SwiftUI

struct PlayListDesCell: View {
    // MARK: - Properties
    
    /// Description text for the playlist
    var descriptionText: String = Product.mock.description
    
    /// Creator's username
    var crUserName: String = "Sabbir"
    
    /// Additional subheadline text
    var subheadline: String = "Demo subheadline goes here"
    
    // MARK: - Button Action Handlers (Closures)
    
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onElipsisPressed: (() -> Void)? = nil
    var onSufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Playlist description
            Text(descriptionText)
                .foregroundStyle(.spLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // "Made for You" section with creator's name
            madeForYouSection
            
            // Subheadline text
            Text(subheadline)
            
            // Action buttons section
            buttonSection
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spLightGray)
    }
}

extension PlayListDesCell {
    // MARK: - View Components
    
    /// Displays the "Made for You" section
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo") // Apple logo icon
                .font(.title3)
                .foregroundStyle(.spGreen) // Green color for the icon
            
            Text("Made for ") +
            Text(crUserName) // Displays the creator's name
                .bold()
                .foregroundStyle(.spWhite)
        }
    }
    
    /// Displays the button section for actions like adding, downloading, sharing, etc.
    private var buttonSection: some View {
        HStack(spacing: 0) {
            // Left-side buttons: Add to playlist, Download, Share, and Ellipsis
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001)) // Invisible tap area
                    .onTapGesture { onAddToPlaylistPressed?() } // Add to playlist action
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture { onDownloadPressed?() } // Download action
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture { onSharePressed?() } // Share action
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture { onElipsisPressed?() } // More options action
            }
            .offset(x: -8) // Adjusting alignment
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Right-side buttons: Shuffle and Play
            HStack(spacing: 8) {
                Image(systemName: "shuffle") // Shuffle button
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture { onSufflePressed?() }
                
                Image(systemName: "play.circle.fill") // Play button
                    .font(.system(size: 45))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture { onPlayPressed?() }
            }
            .foregroundStyle(.spGreen) // Green color for shuffle and play buttons
        }
        .font(.title2)
    }
}

// MARK: - Preview
#Preview {
    PlayListDesCell()
}


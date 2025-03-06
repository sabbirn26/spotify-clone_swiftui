//
//  PlayListDesCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 6/3/25.
//

import SwiftUI

struct PlayListDesCell: View {
    var descriptionText: String = Product.mock.description
    var crUserName: String = "Sabbir"
    var subheadline: String = "Demo subheadline goes here"
    
    var onAddToPlaylistPressed : (() -> Void)? = nil
    var onDownloadPressed : (() -> Void)? = nil
    var onSharePressed : (() -> Void)? = nil
    var onElipsisPressed : (() -> Void)? = nil
    var onSufflePressed : (() -> Void)? = nil
    var onPlayPressed : (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8,content: {
            Text(descriptionText)
                .foregroundStyle(.spLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8,content: {
                Image(systemName: "applelogo")
                    .font(.title3)
                    .foregroundStyle(.spGreen)
                
                Text("Made for ")
                +
                Text(crUserName)
                    .bold()
                    .foregroundStyle(.spWhite)
                
            })
        })
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spLightGray)
    }
}

#Preview {
    PlayListDesCell()
}

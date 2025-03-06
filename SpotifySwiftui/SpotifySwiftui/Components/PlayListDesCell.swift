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
            
            madeForYouSection
            Text(subheadline)
            buttonSection
            
        })
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spLightGray)
    }
}

extension PlayListDesCell {
    //MARK: View Parts
    private var madeForYouSection : some View {
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
    }
    
    private var buttonSection : some View {
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        //code here
                        onAddToPlaylistPressed?()
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        //code here
                        onDownloadPressed?()
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        //code here
                        onSharePressed?()
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        //code here
                        onElipsisPressed?()
                    }
                
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 8){
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        //code here
                        onSufflePressed?()
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 45))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        //code here
                        onPlayPressed?()
                    }
            }
            .foregroundStyle(.spGreen)
        }
        .font(.title2)
    }
}

#Preview {
    PlayListDesCell()
}

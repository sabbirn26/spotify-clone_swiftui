//
//  SongRowCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 6/3/25.
//

import SwiftUI

struct SongRowCell: View {
    var imageName = Constants.randomImage
    var imageSize: CGFloat = 50
    var cellTitle: String = "Demo title"
    var cellSubtitle: String? = "Demo Subtitle"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8){
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4){
                Text(cellTitle)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spWhite)
                
                if let cellSubtitle{
                    Text(cellSubtitle)
                        .font(.callout)
                        .foregroundStyle(.spLightGray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spWhite)
                .background(Color.black.opacity(0.001))
                .padding(16)
                .onTapGesture {
                    //code here
                    onEllipsisPressed?()
                }
        }
    }
}

#Preview {
    ZStack{
        Color.spBlack.ignoresSafeArea()
        
        VStack{
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }

}

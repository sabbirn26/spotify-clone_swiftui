//
//  PlayListHeaderCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 5/3/25.
//

import SwiftUI

struct PlayListHeaderCell: View {
    var height: CGFloat = 300
    var title: String = "This is the demo title"
    var subtitle: String = "This is the demo subtitle"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spBlack.opacity(0.8)
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            
//            .frame(height: 300)
            .overlay(
                VStack(alignment: .leading, spacing: 8){
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                    .foregroundStyle(.spWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                    )
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack{
        Color.spBlack.ignoresSafeArea()
        
        ScrollView{
            PlayListHeaderCell()
        }
        .ignoresSafeArea()
    }
}

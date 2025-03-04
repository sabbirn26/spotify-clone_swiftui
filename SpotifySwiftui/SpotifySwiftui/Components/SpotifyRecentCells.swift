//
//  SpotifyRecentCells.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 4/3/25.
//

import SwiftUI

struct SpotifyRecentCells: View {
    var imageName : String = Constants.randomImage
    var title : String = "Some random title"
    var body: some View {
        HStack{
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
            Spacer()
        }
        .padding(.trailing, 8)
        .themeColors(isSelected: false)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack{
        Color.spBlack.ignoresSafeArea()
        
        VStack{
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

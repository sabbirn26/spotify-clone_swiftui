//
//  SpotifyNewReleasedCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 4/3/25.
//

import SwiftUI

struct SpotifyNewReleasedCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some artist name"
    
    var title: String? = "demo title"
    var subtitle: String? = "demo subtitle"
    
    var body: some View {
        VStack(spacing: 16) {
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .foregroundStyle(.spWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 2){
                        if let title {
                            Text(title)
                                .foregroundStyle(.spWhite)
                                .fontWeight(.semibold)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack{
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .foregroundStyle(.spLightGray)
                            .onTapGesture {
                                //do something here -
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "play.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.spWhite)
                            .onTapGesture {
                                //do something here -
                            }
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
        }
    }
}

#Preview {
    ZStack{
        Color.spBlack.ignoresSafeArea()
        
        
        SpotifyNewReleasedCell()
            .padding()
    }
    
}

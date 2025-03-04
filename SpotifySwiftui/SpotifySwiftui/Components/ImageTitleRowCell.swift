//
//  ImageTitleRowCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 4/3/25.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    var title: String = "Demo title name"
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spLightGray)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ImageTitleRowCell()
}

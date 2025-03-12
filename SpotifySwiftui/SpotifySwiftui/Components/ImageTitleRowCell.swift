//
//  ImageTitleRowCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 4/3/25.
//

import SwiftUI

/// A reusable cell that displays an image with a title underneath
struct ImageTitleRowCell: View {
    var imageName: String = Constants.randomImage // Default image URL
    var imageSize: CGFloat = 100
    var title: String = "Demo title name"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image Loader with dynamic size
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            // Title text with styling
            Text(title)
                .font(.callout)
                .foregroundStyle(.spLightGray)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

// Preview to test the UI
#Preview {
    ImageTitleRowCell()
}


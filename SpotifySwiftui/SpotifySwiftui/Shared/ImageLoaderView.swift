//
//  ImageLoaderView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import SwiftUI
import SDWebImageSwiftUI // Importing the library for loading images asynchronously

// A SwiftUI view for loading and displaying an image from a URL
struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage // Default image URL if none is provided
    var resizingMode: ContentMode = .fill // Image content mode (default is `.fill`)
    
    var body: some View {
        Rectangle() // Placeholder rectangle for layout purposes
            .opacity(0.001) // Makes the rectangle almost invisible
            .overlay( // Overlaying the image on top of the rectangle
                WebImage(url: URL(string: urlString)) // Load image from URL
                    .resizable() // Allow the image to resize
                    .indicator(.activity) // Show a loading indicator while fetching the image
                    .aspectRatio(contentMode: resizingMode) // Set aspect ratio based on provided mode
            )
            .clipped() // Clip the image to fit the parent container
    }
}

// SwiftUI Preview for testing ImageLoaderView with rounded corners and padding
#Preview {
    ImageLoaderView()
        .cornerRadius(30) // Apply rounded corners
        .padding(40) // Apply padding on all sides
        .padding(.vertical, 60) // Additional vertical padding
}


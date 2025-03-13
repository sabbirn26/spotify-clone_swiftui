//
//  InterestPillView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import SwiftUI

// A custom view that displays an interest pill with an optional icon or emoji
struct InterestPillView: View {
    
    // Optional system icon name (default: "heart.fill")
    var iconName: String? = "heart.fill"
    
    // Optional emoji (default: "🤙")
    var emoji: String? = "🤙"
    
    // The text displayed in the pill (default: "Graduate Degree")
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack(spacing: 4) { // Horizontal stack with slight spacing
            if let iconName { // If an icon name is provided, display the system image
                Image(systemName: iconName)
            } else if let emoji { // If no icon, but an emoji is provided, display the emoji
                Text(emoji)
            }
            
            Text(text) // Display the text
        }
        .font(.callout) // Set font size
        .fontWeight(.medium) // Medium font weight
        .padding(.vertical, 6) // Add vertical padding
        
    }
}

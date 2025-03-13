//
//  UserInterest.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import Foundation
import SwiftfulUI // Importing SwiftfulUI for `NonLazyVGrid`
import SwiftUI

// A model representing a user's interest, conforming to Identifiable for use in lists/grids
struct UserInterest: Identifiable {
    let id = UUID().uuidString // Unique identifier for each interest
    var iconName: String? = nil // Optional system icon name
    var emoji: String? = nil // Optional emoji representation
    var text: String // The label for the interest
}

// A view that displays a grid of interest pills
struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.basics // Default interests from mock user data
    
    var body: some View {
        ZStack { // Overlay container (not strictly necessary here)
            // Non-lazy vertical grid layout with 2 columns, left alignment, and 8-point spacing
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest { // Ensure interest is not nil
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    ) // Display an interest pill
                } else {
                    EmptyView() // If no valid interest, show nothing
                }
            }
        }
    }
}

// SwiftUI Preview for testing the InterestPillGridView with sample user data
#Preview {
    VStack(spacing: 40) { // Vertical stack with spacing
        InterestPillGridView(interests: User.mock.basics) // Display user's basic info
        InterestPillGridView(interests: User.mock.interests) // Display user's interests
    }
}


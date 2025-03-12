//
//  SpotifyCatagoryCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI

// This view represents a category selection button with dynamic styling
struct SpotifyCatagoryCell: View {
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected) // Applies custom theme colors based on selection state
            .cornerRadius(60)
    }
}

// This extension adds a modifier to apply theme colors dynamically
extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spGreen : .spDarkGray) // Green for selected, dark gray otherwise
            .foregroundStyle(isSelected ? .spBlack : .spWhite) // Black text for selected, white otherwise
    }
}

// Preview for testing different selection states of SpotifyCatagoryCell
#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40){
            SpotifyCatagoryCell(title: "All", isSelected: false)
            SpotifyCatagoryCell(title: "Demo title", isSelected: true)
            SpotifyCatagoryCell(title: "Podcast", isSelected: true)
        }
    }
}

//
//  SpotifyCatagoryCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI

struct SpotifyCatagoryCell: View {
    var title: String = "All"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(60)
        
    }
}
extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spGreen : .spDarkGray)
            .foregroundStyle(isSelected ? .spBlack : .spWhite)
    }
}

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

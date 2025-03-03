//
//  SpotifyCatagoryCell.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI

struct SpotifyCatagoryCell: View {
    var title: String = "Music"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(isSelected ? .spGreen : .spDarkGray)
            .foregroundStyle(isSelected ? .spBlack : .spWhite)
            .cornerRadius(60)
        
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

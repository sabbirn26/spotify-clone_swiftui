//
//  InterestPillView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import SwiftUI

struct InterestPillView: View {
    
    var iconName: String? = "heart.fill"
    var emoji: String? = "🤙"
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.black)
        .background(.yellow)
        .cornerRadius(32)
    }
}

#Preview {
    VStack {
        InterestPillView(iconName: nil)
        InterestPillView()
    }
}

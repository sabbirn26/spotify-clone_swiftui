//
//  UserInterest.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import Foundation
import SwiftfulUI
import SwiftUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.basics
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        InterestPillGridView(interests: User.mock.basics)
        InterestPillGridView(interests: User.mock.interests)
    }
}

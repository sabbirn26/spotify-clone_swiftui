//
//  SpotifySwiftuiApp.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import SwiftUI
import SwiftfulRouting
@main
struct SpotifySwiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                SpotifyHomeView()
            }
        }
    }
}

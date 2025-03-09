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

//this extension helps us to swipe back to the preview view
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

//
//  SpotifyHomeView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 3/3/25.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User? = nil
    var body: some View {
        ZStack{
            Color.spBlack.ignoresSafeArea()
            
            HStack{
                if let currentUser {
                    ImageLoaderView()
                        .frame(width: 30, height: 30)
                        .background(.spWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("Profile View Tapped")
                        }
                }
                
                ScrollView (.horizontal){
                    HStack(spacing: 8){
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                            
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
//            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    SpotifyHomeView()
}

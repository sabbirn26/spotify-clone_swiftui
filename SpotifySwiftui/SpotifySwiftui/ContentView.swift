//
//  ContentView.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products: [Product] = []
    var body: some View {
        ScrollView{
            VStack{
                ForEach(products) { products in
                    Text(products.title)
                    
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}

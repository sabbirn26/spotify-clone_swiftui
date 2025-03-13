//
//  DatabaseHelper.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import Foundation

// A helper struct for fetching data from an API
struct DatabaseHelper {
    
    // Fetches a list of products from the API
    func getProducts() async throws -> [Product] {
        // Ensure the URL is valid
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL) // Throw an error if the URL is invalid
        }
        
        // Fetch data asynchronously using URLSession
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode the JSON response into a `ProductArray` struct
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        
        // Return the list of products
        return products.products
    }
    
    // Fetches a list of users from the API
    func getUsers() async throws -> [User] {
        // Ensure the URL is valid
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL) // Throw an error if the URL is invalid
        }
        
        // Fetch data asynchronously using URLSession
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode the JSON response into a `UserArray` struct
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        
        // Return the list of users
        return users.users
    }
}


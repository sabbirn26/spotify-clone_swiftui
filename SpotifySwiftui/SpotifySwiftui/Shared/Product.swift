//
//  Product.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import Foundation

// Struct representing an array of products, conforming to Codable for easy encoding/decoding
struct ProductArray: Codable {
    let products: [Product] // List of products
    let total, skip, limit: Int // Pagination details
}

// Struct representing an individual product, conforming to Codable for JSON parsing and Identifiable for use in SwiftUI lists
struct Product: Codable, Identifiable {
    let id: Int // Unique identifier for the product
    let title, description: String // Product title and description
    let price: Double // Price of the product, stored as Double for precision
    let discountPercentage, rating: Double // Discount percentage and rating values
    let stock: Int // Available stock count
    let brand: String? // Optional brand name (can be nil)
    let category: String // Product category
    let thumbnail: String // Thumbnail image URL
    let images: [String] // Array of image URLs

    // Computed property that returns the first image from the images array or a random default image
    var firstImage: String {
        images.first ?? Constants.randomImage
    }

    // Computed property to return brand name, or an empty string if brand is nil
    var _brand: String {
        brand ?? ""
    }

    // Randomly determines if a product is "recently added" (25% chance)
    let recentlyAdded: Bool = {
        return Int.random(in: 1...4) == 1
    }()
    
    // A static mock product for testing or previews
    static var mock: Product {
        Product(
            id: 123,
            title: "Example product title",
            description: "This is some mock product description that goes here.",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            category: "Electronic Devices",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage]
        )
    }
}

// Struct representing a row of products, used for grouping products by categories or sections in a UI
struct ProductRow: Identifiable {
    let id = UUID().uuidString // Unique identifier for the row
    let title: String // Title for the row (e.g., category name)
    let products: [Product] // List of products in this row
}

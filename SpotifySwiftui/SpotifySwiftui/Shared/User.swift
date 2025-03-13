//
//  User.swift
//  SpotifySwiftui
//
//  Created by Sabbir Nasir on 2/3/25.
//

import Foundation

// A struct representing an array of users, conforming to Codable for easy JSON encoding/decoding
struct UserArray: Codable {
    let users: [User] // List of users
    let total, skip, limit: Int // Pagination details
}

// A struct representing an individual user, conforming to Codable for JSON parsing and Identifiable for SwiftUI lists
struct User: Codable, Identifiable {
    let id: Int // Unique identifier for the user
    let firstName, lastName: String // User's first and last name
    let age: Int // User's age
    let email, phone, username, password: String // Contact and login credentials
    let image: String // User profile image URL
    let height: Double // User's height (stored as Double for precision)
    let weight: Double // User's weight

    // Computed property that returns the user's work status
    var work: String {
        "Worker as Some Job"
    }
    
    // Computed property that returns the user's education level
    var education: String {
        "Graduate Degree"
    }
    
    // Computed property that provides a brief "About Me" description
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile!"
    }

    // Computed property that returns a list of basic user details as `UserInterest` objects
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"), // User height
            UserInterest(iconName: "graduationcap", emoji: nil, text: education), // Education
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"), // Drinking habit
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo"), // Zodiac sign
        ]
    }

    // Computed property that returns a list of user's interests as `UserInterest` objects
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "👟", text: "Running"), // Interest in running
            UserInterest(iconName: nil, emoji: "🏋️‍♂️", text: "Gym"), // Interest in gym/fitness
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"), // Interest in music
            UserInterest(iconName: nil, emoji: "🥘", text: "Cooking"), // Interest in cooking
        ]
    }

    // Computed property that returns an array of random images for the user's profile
    var images: [String] {
        ["https://picsum.photos/500/500", "https://picsum.photos/600/600", "https://picsum.photos/700/700"]
    }
    
    // A static mock user for testing or previews
    static var mock: User {
        User(
            id: 444,
            firstName: "Nasir",
            lastName: "Sabbir",
            age: 76,
            email: "hi@hi.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}


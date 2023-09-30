//
//  User.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 8/20/23.
//

import Foundation

struct User: Codable, Identifiable {
    
    let id: String
    let isActive: Bool
    let name: String

    let registered: String
    let friends: [Friends]
}

struct Friends: Codable, Identifiable {
    let id: String
    let name: String
}

//
//  UserFriendsApp.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 8/20/23.
//

import SwiftUI

@main
struct UserFriendsApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

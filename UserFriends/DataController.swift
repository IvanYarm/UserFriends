//
//  DataController.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 9/25/23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "UserAndFriends")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

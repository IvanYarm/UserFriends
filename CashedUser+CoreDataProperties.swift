//
//  CashedUser+CoreDataProperties.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 9/30/23.
//
//

import Foundation
import CoreData


extension CashedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CashedUser> {
        return NSFetchRequest<CashedUser>(entityName: "CashedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?

    public var unwrappedId: String {
        id ?? "Unknown Id"
    }
   
    public var unwrappedName: String {
        name ?? "Unknown Name"
    }
    public var unwrappedRegistered: String {
        registered ?? "Unknown Registered"
    }
    public var friendsArray: [CashedFriend] {
        let set = friends as? Set<CashedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for friends
extension CashedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CashedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CashedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CashedUser : Identifiable {

}

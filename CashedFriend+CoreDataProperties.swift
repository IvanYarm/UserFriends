//
//  CashedFriend+CoreDataProperties.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 9/30/23.
//
//

import Foundation
import CoreData


extension CashedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CashedFriend> {
        return NSFetchRequest<CashedFriend>(entityName: "CashedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var originUser: CashedUser?
    
    public var wrappedName: String {
        name ?? "Uknown name"
    }
    
    public var wrappedId: String {
        id ?? "Unnown id"
    }

}

extension CashedFriend : Identifiable {

}

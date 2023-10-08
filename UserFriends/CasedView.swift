//
//  CasedView.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 10/4/23.
//

import SwiftUI

struct CasedView: View {
    
    @State var users: FetchedResults<CashedUser> 
    
    var body: some View {
        List(users) { user in
            NavigationLink {
                CashedFriendsView(friends: user.friendsArray)
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(user.unwrappedName)
                            .font(.title3)
                        Text(user.isActive ? "User is acitve" : "User not active")
                            .background(user.isActive ? .green : .gray)
                    }
                    Text(user.unwrappedRegistered)
                    
                }
                
            }
        }
    }
}



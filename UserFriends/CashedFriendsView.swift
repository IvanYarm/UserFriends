//
//  CashedFriendsView.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 10/4/23.
//

import SwiftUI

struct CashedFriendsView: View {
    
         
        @State var friends: [CashedFriend]

        var body: some View {
            NavigationView {
                List(friends) { user in
                    Text(user.wrappedName)
                }
                .navigationTitle("Friends")
            }
            
        }
    }


//#Preview {
//    CashedFriendsView()
//}

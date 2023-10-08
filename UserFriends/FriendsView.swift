//
//  FriendsView.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 8/20/23.
//

import SwiftUI

struct FriendsView: View {
     
    @State var friends: [Friends]

    var body: some View {
        NavigationView {
            List(friends) { user in
                Text(user.name)
            }
            .navigationTitle("Friends")
        }
        
    }
}


#Preview {
    FriendsView(friends: [Friends(id: "23", name: "Ivan"), Friends(id: "223", name: "Boba")])
}

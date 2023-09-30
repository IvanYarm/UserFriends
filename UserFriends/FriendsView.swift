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

//struct FriendsView_Previews: PreviewProvider {
//    static var friends: [Friends] = [Friends(id: "23", name: "Ivan"), Friends(id: "223", name: "Boba")]
//    static var previews: some View {
//        
//        FriendsView(friends: friends)
//    }
//}

//#Preview {
//    FriendsView(friends: [Friends(id: "23", name: "Ivan"), Friends(id: "223", name: "Boba")])
//}

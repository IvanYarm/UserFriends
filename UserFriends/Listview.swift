//
//  Listview.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 8/24/23.
//

import SwiftUI

struct Listview: View {
    @State var users: [User]
    var body: some View {
        List(users) { user in
            NavigationLink {
                FriendsView(friends: user.friends)
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.title3)
                        Text(user.isActive ? "User is acitve" : "User not active")
                            .background(user.isActive ? .green : .red)
                    }
                    Text(user.registered)
                    
                }
                
            }
        }
    }
}

struct Listview_Previews: PreviewProvider {
    static var previews: some View {
        var use = [User(id: "32", isActive: true, name: "Ivan yar", registered: "2015-11-10T01:47:18-00:00", friends: [Friends(id: "74", name: "Me"), Friends(id: "25", name: "He")]), User(id: "2", isActive: false, name: "Zhanna Kim",registered: "2015-11-10T01:47:18-00:00", friends: [Friends(id: "74", name: "Me"), Friends(id: "25", name: "He")])]
        Listview(users: use)
    }
}

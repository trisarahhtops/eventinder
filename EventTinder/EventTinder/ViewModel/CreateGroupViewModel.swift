//
//  CreateGroupViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 09.05.24.
//

import Foundation

class CreateGroupViewModel: ObservableObject {
    @Published var groupname: String
    @Published var friends: [Friend] = []
    var isSelected = false
    
    init(){
        self.groupname = ""
        let users: [String] = getAllUsers()
        for user in users {
            self.friends.append(Friend(username: user))
        }
    }
    
    func getAllUsers() -> [String] {
        // TODO get user names or change the function
        return ["Bella", "Sarah", "Günther", "Klaus"]
    }
    
    /*
    func getFriendnames() -> [String] {
        let friendnames: [String] = []
        for friends { friend in
            friendnames.append(friend.username)
        }
        return friendnames
    }*/
}

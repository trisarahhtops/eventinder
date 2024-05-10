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
    
    func getFriendnames() -> [String]{
        var friendnames: [String] = []
        for friend in friends {
            if (friend.isSelected) {
                friendnames.append(friend.username)
            }
        }
        return friendnames
    }
    
    func getIsSelected() -> Bool{
        for friend in friends {
            if friend.isSelected { return true }
        }
        return false
    }
}

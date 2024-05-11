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
        getAllUsers()
    }
    
    // requests and saves all users into the friends array
    func getAllUsers()  {
        Task{
            let users: [String] = await UserManagerViewModel.shared.getAllUserIds()
            for user in users {
                self.friends.append(Friend(username: user))
            }
        }
    }
    
    // returns all usernames that have been selected by the user
    func getFriendnames() -> [String]{
        var friendnames: [String] = []
        for friend in friends {
            if (friend.isSelected) {
                friendnames.append(friend.username)
            }
        }
        return friendnames
    }
    
    // returns whether a user is selected
    func getIsSelected() -> Bool{
        for friend in friends {
            if friend.isSelected { return true }
        }
        return false
    }
}

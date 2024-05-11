//
//  GroupsViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

//structure group: has id, list with id of all members in the group, a name and group picture name
struct group: Codable, Hashable {
    let gid: String
    let members: [String]
    var name: String
    var pic: String
}

final class GroupsViewModel {
    static let shared = GroupsViewModel() //so that the GroupsViewModel is the same every time used
    private var groupcounter = 0        //counts which group id is the next one
    
    init(){
        //sets groupcounter
        howManyGroups()
    }
    
    //for faster and cleaner useage
    private let groupCollection = Firestore.firestore().collection("groups")
    private func groupDocument(groupId: String) -> DocumentReference {
        groupCollection.document(groupId)
    }
    
    func howManyGroups(){
        //counts how many groups there already are to set the groupcounter
        Task{
            var counter: Int = 0
            do {
                let querySnapshot = try await groupCollection.getDocuments()
                for _ in querySnapshot.documents {
                    counter += 1
                }
            } catch {
                print("Error getting documents: \(error)")
            }
            groupcounter = counter
        }
    }
    
    func createNewGroup(members: [String], name: String, pic: String) async throws {
        //uses arguments passed to it and the groupcounter to create a group which is then saved in the database. Updates groupcounter.
        let gr = group(gid: "\(groupcounter)", members: members, name: name, pic: pic)
            try groupDocument(groupId: gr.gid).setData(from: gr, merge: false)
        groupcounter = groupcounter + 1
    }
    
    func editGroup(group: group) async throws {
        //to change variables of group (e.g. picture, members)
            try groupDocument(groupId: group.gid).setData(from: group, merge: true)
    }
    
    /*
    func checkMembers(memb: [String]) async throws -> Bool {
     //checks whether an entered member is actually a user
        var allExist = true
        for i in memb {
            groupDocument(groupId: i).getDocument { (document, error) in
                if let document = document, document.exists {
                
                } else {
                    allExist = false
                }
            }
        }
        return allExist
    }
    */
    
    func groupsOfUser(userId: String) async throws -> [group] {
        //returns all the groups a user is part of
        var groups: [group] = []
        do {
          let querySnapshot = try await groupCollection.getDocuments()  //gets all groups in the database
          for doc in querySnapshot.documents {
              let data = doc.data()
              let memb = data["members"] as! [String]
              if memb.contains(userId){                                 //checks whether the user is a group member. If so, appends the found group to the array groups
                  groups.append(group(gid: data["gid"] as! String, members: memb, name: data["name"] as! String, pic: data["pic"] as! String))
              }
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        return groups
    }
    
    func numberOfMatches(groupId: String) async -> Int {
        //returns the number of matches for a specific group. Used to display in GroupView where all groups a user is part of are shown
        do{
            let mutualLikes = try await mutualLikes(groupId: groupId)   //uses mutualLikes to get all matches of the group and then returns the amount
            return mutualLikes.count
        } catch {
            return 0
        }
    }
    
    func getGroupName(groupId: String) async -> String {
        //returns the groupname
        do{
            let name = try  await groupDocument(groupId: groupId).getDocument(as: group.self).name      //gets document of that group from database and returns the name
            return name
        } catch {
            return "no group name found"
        }
    }
    
    func mutualLikes(groupId: String) async throws -> [String] {
        //returns event ids of the events that everyone in the group liked
        
        //first saves all liked event by group member in an array
        var likedEventsByMembers: [[String]?] = []
        for i in try await groupDocument(groupId: groupId).getDocument(as: group.self).members {
            if(i != ""){
                await likedEventsByMembers.append(try Firestore.firestore().collection("users").document(i).getDocument(as: UserDB.self).eventIds)
            }
        }
        let memb1Events = likedEventsByMembers[0]
        var mutualLikedEvents: [String] = []
        
        //if first member has nothing liked, the return has to be []. Prevents fatal runtime errors.
        if memb1Events == nil {
            return []
        }
        
        //looks for every event the first member liked whether everyone else in the group liked that event too and, if so, appends the id to mutualLikedEvents which is then returned
        for i in memb1Events! {
            var eventFound = true
            for j in likedEventsByMembers {
                if(j!.contains(i)){
                    
                } else {
                    eventFound = false
                }
            }
            if eventFound {
                mutualLikedEvents.append(i)
            }
        }
        return mutualLikedEvents
    }
}

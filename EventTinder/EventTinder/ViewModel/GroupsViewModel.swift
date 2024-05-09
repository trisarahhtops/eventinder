//
//  GroupsViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct group: Codable {
    let gid: String
    let members: [String]
    let name: String
    let pic: String
}

final class GroupsViewModel {
    static let shared = GroupsViewModel()
    
    private let groupCollection = Firestore.firestore().collection("groups")
    
    private func groupDocument(groupId: String) -> DocumentReference {
        groupCollection.document(groupId)
    }
    
    func createNewGroup(group: group) async throws {
       // if try await checkMembers(memb: group.members) {
            try groupDocument(groupId: group.gid).setData(from: group, merge: false)
        /*} else {
            print("Not all members exist")
        }*/
    }
    
    func editGroup(group: group) async throws {
        //if try await checkMembers(memb: group.members){
            try groupDocument(groupId: group.gid).setData(from: group, merge: true)
        /*} else {
            print("Not all members exist")
        }*/

    }
    
    /*
    func checkMembers(memb: [String]) async throws -> Bool {
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
        var groups: [group] = []
        let querySnapshot = try await groupCollection.whereField("members", arrayContains: userId).getDocuments()
        for doc in querySnapshot.documents {
            let data = doc.data()
            let gid = data["gid"] as! String
            let members = data["members"] as! [String]
            let name = data["name"] as! String
            let pic = data["pic"] as! String
            let group = group(gid: gid, members: members, name: name, pic: pic)
            groups.append(group)
        }
        return groups
    }
    
    func numberOfMatches(groupId: String) async -> Int {
        do{
            let mutualLikes = try await mutualLikes(groupId: groupId)
            return mutualLikes.count
        } catch {
            return 0
        }
    }
    
    func getGroupName(groupId: String) async -> String {
        do{
            let name = try  await groupDocument(groupId: groupId).getDocument(as: group.self).name
            return name
        } catch {
            return "no group name found"
        }
    }
    
    func mutualLikes(groupId: String) async throws -> [String] {
        var likedEventsByMembers: [[String]?] = []
        for i in try await groupDocument(groupId: groupId).getDocument(as: group.self).members {
            await likedEventsByMembers.append(try Firestore.firestore().collection("users").document(i).getDocument(as: UserDB.self).eventIds)
        }
        let memb1Events = likedEventsByMembers[0]
        var mutualLikedEvents: [String] = []
        if memb1Events == nil {
            return []
        }
        for i in memb1Events! {
            var eventFound = true
            for j in likedEventsByMembers {
                if((j?.contains(i)) != nil){
                    
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

//
//  GroupsViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct group: Codable, Hashable {
    let gid: String
    let members: [String]
    var name: String
    var pic: String
}

final class GroupsViewModel {
    static let shared = GroupsViewModel()
    private var groupcounter = 0
    
    init(){
        howManyGroups()
    }
    
    private let groupCollection = Firestore.firestore().collection("groups")
    
    private func groupDocument(groupId: String) -> DocumentReference {
        groupCollection.document(groupId)
    }
    
    func howManyGroups(){
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
        print("\(groupcounter)")
        let gr = group(gid: "\(groupcounter)", members: members, name: name, pic: pic)
       // if try await checkMembers(memb: group.members) {
        print("groupcounter: \(groupcounter)")
            try groupDocument(groupId: gr.gid).setData(from: gr, merge: false)
        groupcounter = groupcounter + 1
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
        do {
          let querySnapshot = try await groupCollection.getDocuments()
          for doc in querySnapshot.documents {
              let data = doc.data()
              let memb = data["members"] as! [String]
              if memb.contains(userId){
                  groups.append(group(gid: data["gid"] as! String, members: memb, name: data["name"] as! String, pic: data["pic"] as! String))
              }
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        print(groups)
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
            if(i != ""){
                await likedEventsByMembers.append(try Firestore.firestore().collection("users").document(i).getDocument(as: UserDB.self).eventIds)
            }
        }
        let memb1Events = likedEventsByMembers[0]
        var mutualLikedEvents: [String] = []
        if memb1Events == nil {
            return []
        }
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

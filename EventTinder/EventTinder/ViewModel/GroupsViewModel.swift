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
}

final class GroupsViewModel {
    static let shared = GroupsViewModel()
    
    private let groupCollection = Firestore.firestore().collection("groups")
    
    private func groupDocument(groupId: String) -> DocumentReference {
        groupCollection.document(groupId)
    }
    
    func createNewGroup(group: group) async throws {
        if try await checkMembers(memb: group.members) {
            try groupDocument(groupId: group.gid).setData(from: group, merge: false)
        }
    }
    
    func editGroup(group: group) async throws {
        if try await checkMembers(memb: group.members){
            try groupDocument(groupId: group.gid).setData(from: group, merge: true)
        }

    }
    
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
    
    func mutualLikes(groupId: String) async throws -> [Events] {
        var likedEventsByMembers: [[String]?] = []
        for i in try await groupDocument(groupId: groupId).getDocument(as: group.self).members {
            await likedEventsByMembers.append(try Firestore.firestore().collection("users").document(i).getDocument(as: User.self).eventIds)
        }
        let memb1Events = likedEventsByMembers[0]
        var mutualLikedEvents: [String] = []
        if memb1Events == nil {
            return []
        }
        for i in memb1Events! {
            for j in likedEventsByMembers {
                if((j?.contains(i)) != nil){
                    
                } else {
                    break
                }
            }
        }
    }
}

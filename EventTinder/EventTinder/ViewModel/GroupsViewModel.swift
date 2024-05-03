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
        try groupDocument(groupId: group.gid).setData(from: group, merge: false)
    }
    
    func editGroup(group: group) async throws {
        try groupDocument(groupId: group.gid).setData(from: group, merge: true)
    }
}

//
//  GroupViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 9/5/2024.
//

import Foundation
import FirebaseAuth

class GroupViewModel: ObservableObject {
    @Published var groups: [group] = []

    init() {
        fetchGroups()
    }

    public func fetchGroups() {
        //gets the groups of a specific user from the database to display on the group screen
        Task {
            do {
                groups = try await GroupsViewModel.shared.groupsOfUser(userId: UserData.shared.username)
            } catch {
                groups = []
            }
        }
    }
}

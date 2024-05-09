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

    private func fetchGroups() {
        Task {
            do {
                groups = try await GroupsViewModel.shared.groupsOfUser(userId: Auth.auth().currentUser!.uid)
            } catch {
                groups = []
            }
        }
    }
}

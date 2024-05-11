//
//  MatchesViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 9/5/2024.
//

import Foundation

class MatchesViewModel: ObservableObject {
    @Published var matches: [String] = []
    @Published var groupName: String = ""

    init(groupId: String) {
        //sets matches and groupname from database
        fetchMatchesAndGroupName(groupId: groupId)
    }

    private func fetchMatchesAndGroupName(groupId: String) {
        Task {
            do {
                self.matches = try await GroupsViewModel.shared.mutualLikes(groupId: groupId)
            } catch {
                self.matches = []
            }

            self.groupName = await GroupsViewModel.shared.getGroupName(groupId: groupId)
        }
    }
}

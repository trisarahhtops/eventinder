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
        fetchMatchesAndGroupName(groupId: groupId)
    }

    private func fetchMatchesAndGroupName(groupId: String) {
        Task {
            do {
                self.matches = try await GroupsViewModel.shared.mutualLikes(groupId: groupId)
            } catch {
                self.matches = []
                print("Problem with getting matches: \(error)")
            }

            self.groupName = await GroupsViewModel.shared.getGroupName(groupId: groupId)
        }
    }
}

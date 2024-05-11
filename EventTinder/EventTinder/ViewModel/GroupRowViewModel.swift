//
//  GroupViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 9/5/2024.
//

import Foundation

class GroupRowViewModel: ObservableObject {
    @Published var numOfMatches: Int = 0

    func fetchNumOfMatches(groupId: String) {
        Task {
            let matches = await GroupsViewModel.shared.numberOfMatches(groupId: groupId)
            DispatchQueue.main.async {
                self.numOfMatches = matches
                print("\(matches)")
            }
        }
    }
}

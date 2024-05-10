//
//  GroupViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 9/5/2024.
//

import Foundation

class GroupRowViewModel: ObservableObject {
    @Published var numOfMatches = 0

    /*init(groupId: String) {
        fetchNumOfMatches(groupId: groupId)
    }*/

    /*private*/ func fetchNumOfMatches(groupId: String) {
        Task {
            numOfMatches = await GroupsViewModel.shared.numberOfMatches(groupId: groupId)
        }
    }
}

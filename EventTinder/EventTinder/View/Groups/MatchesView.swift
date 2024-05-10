//
//  MatchesView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct MatchesView: View {
    let groupId: String
    @State var matches: [String] = ["1","4"]
    @State var groupName: String = ""
    @State private var viewModel: MatchesViewModel
    
    
    init(groupId: String) {
        self.groupId = groupId
        viewModel = MatchesViewModel(groupId: groupId)
    }
     /*   fetchMutualLikesAndName()
    }
    
    private func fetchMutualLikesAndName(){
        Task{
            do{
                self.matches = try await GroupsViewModel.shared.mutualLikes(groupId: groupId)
                self.groupName = try await GroupsViewModel.shared.getGroupName(groupId: groupId)
            } catch {
                self.matches = []
                self.groupName = ""
                print("Problem with getting matches or name")
            }
        }
    } */
    
    var body: some View {
        Text("Matches of \(viewModel.groupName)")
            .font(.title)
            .bold()
        Spacer()
        if(viewModel.matches.isEmpty){
            Text("No matches yet")
        } else {
            List(viewModel.matches, id: \.self) { match in
                MatchesRowView(id: match)
            }
        }
    }
}
/*
#Preview {
    MatchesView(groupId: "Group1")
}*/

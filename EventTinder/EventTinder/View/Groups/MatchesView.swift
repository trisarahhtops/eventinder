//
//  MatchesView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct MatchesView: View {
    let groupId: String = "5"
    @State var matches: [String] = ["1","4"]
    let groupName: String = "Test"
    
    /*
    init(groupId: String) async{
        self.groupId = groupId
        do{
            self.matches = try await GroupsViewModel.shared.mutualLikes(groupId: groupId)
        } catch {
            self.matches = []
            print("Problem with getting matches")
        }
        self.groupName = await GroupsViewModel.shared.getGroupName(groupId: groupId)
    }
    */
    var body: some View {
        Text("Matches of Group \(groupName)")
            .font(.title)
            .bold()
        Spacer()
        
        List(matches, id: \.self) { match in
            MatchesRowView(id: match)
        }
    }
}
/*
#Preview {
    MatchesView(groupId: "Group1")
}*/

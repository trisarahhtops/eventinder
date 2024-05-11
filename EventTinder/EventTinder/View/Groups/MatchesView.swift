//
//  MatchesView.swift
//  EventTinder
//
//  Created by Julia Eisele on 09.05.2024
//



import SwiftUI

struct MatchesView: View {
    let groupId: String
    @State private var viewModel: MatchesViewModel
    
    
    init(groupId: String) {
    //saves groupId and creates viewModel based on that groupId
        self.groupId = groupId
        viewModel = MatchesViewModel(groupId: groupId)
    }

    //shows all the matched events of a group    
    var body: some View {
    //shows groupname
        Text("Matches of \(viewModel.groupName)")
            .font(.title)
            .bold()
        Spacer()
    //says "No matches yet" or, if there are any matches, shows all matches in a List. Creates MatchesRowView for every matched event to do so
        if(viewModel.matches.isEmpty){
            Text("No matches yet")
        } else {
            List(viewModel.matches, id: \.self) { match in
                MatchesRowView(id: match)
            }
        }
    }
}


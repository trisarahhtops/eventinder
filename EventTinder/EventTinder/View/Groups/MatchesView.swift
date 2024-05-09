//
//  MatchesView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct MatchesView: View {
    let groupId: String
    
    @State private var viewModel: MatchesViewModel
    
    init(groupId: String) {
        self.groupId = groupId
        viewModel = MatchesViewModel(groupId: groupId)
        
    }
    
    var body: some View {
        Text("Matches of Group \(viewModel.groupName)")
            .font(.title)
            .bold()
        Spacer()
        
        List(viewModel.matches, id: \.self) { match in
            MatchesRowView(id: match)
        }
    }
}

#Preview {
    MatchesView(groupId: "Group1")
}

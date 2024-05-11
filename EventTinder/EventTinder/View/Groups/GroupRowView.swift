//
//  GroupRowView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct GroupRowView: View {
    @Binding private var group: group
    @ObservedObject private var viewModel: GroupRowViewModel = GroupRowViewModel()

    init(group: Binding<group>) {
        self._group = group
        getNumberOfMatches()
    }
    
    func getNumberOfMatches() {
        return viewModel.fetchNumOfMatches(groupId: group.gid)
    }
    
    // creates the list element of a group in group view
    var body: some View {
        ZStack {
            // creates an indicator to highlight that there are matches in a group
            if viewModel.numOfMatches > 0{
                Circle()
                    .frame(width: 14, height: 14, alignment: .leading)
                    .foregroundColor(.accentColor)
                    .padding(.trailing, 0)
                    .offset(x: (UIScreen.main.bounds.width/2 - 50))
            }
            // shows the picture, name and matches of the group
            HStack {
                Image(group.pic)
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray.opacity(0.6))
                VStack {
                    Text(group.name)
                        .font(.headline)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("You have \(viewModel.numOfMatches) matches.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
        }
    }
}


#Preview {
    GroupRowView(group: .constant(group(gid: "1", members: ["Lea", "Anna"], name: "BFF", pic: "group1")))
}


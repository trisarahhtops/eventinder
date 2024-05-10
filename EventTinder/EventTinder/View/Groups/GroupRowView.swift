//
//  GroupRowView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct GroupRowView: View {
    @Binding private var group: group
    @State private var viewModel: GroupRowViewModel

    init(group: Binding<group>) {
        self._group = group
        self.viewModel = GroupRowViewModel()
        viewModel.fetchNumOfMatches(groupId: self.group.gid)
    }
    
    var body: some View {
        ZStack {
            if viewModel.numOfMatches > 0{
                Circle()
                    .frame(width: 14, height: 14, alignment: .leading)
                    .foregroundColor(.accentColor)
                    .padding(.trailing, 0)
                    .offset(x: (UIScreen.main.bounds.width/2 - 40))
            }
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
                    Text("You have \(viewModel.numOfMatches)) matches.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
        }
    }
}

/*
#Preview {
    GroupRowView(group: group(gid: 1, members: <#T##[String]#>, name: <#T##String#>, pic: <#T##String#>))
}
*/

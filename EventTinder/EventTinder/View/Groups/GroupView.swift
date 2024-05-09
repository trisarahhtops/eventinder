//
//  Groupview.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI
import FirebaseAuth

struct GroupView: View {
    @Binding var showSignInView: Bool
    // TODO change to list of groups of user from database
    @State private var viewModel: GroupViewModel = GroupViewModel()

    
    var body: some View {
        VStack {
            HStack {
                Text("My Groups")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                NavigationStack {
                    NavigationLink {
                        ProfileView(showSignInView: $showSignInView)
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(4)
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            NavigationStack {
                NavigationLink {
                    CreateGroupView()
                } label: {
                    Text("Create new group")
                        .font(.headline)
                    Image(systemName: "plus")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accentColor, lineWidth: 2))
                .foregroundColor(.accentColor)
            }
            .padding()
            
            List(viewModel.groups, id: \.gid) { group in
                NavigationLink{
                    MatchesView(groupId: group.gid)
                } label: {
                    GroupRowView(group: group)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
        }
        .padding()
    }
}

/*
#Preview {
    NavigationStack {
        GroupView(showSignInView: .constant(false))
    }
}
*/

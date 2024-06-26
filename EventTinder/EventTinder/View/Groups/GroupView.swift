//
//  Groupview.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct GroupView: View {
    @Binding var showSignInView: Bool
    @ObservedObject private var viewModel = GroupViewModel()
    @State private var path = [Int]()
    
    // creates a view of all groups, lets the user navigate to their profile and to create a new group
    var body: some View {
        VStack {
            HStack {
                // creates screen title
                Text("My Groups")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                // navigates to the profile view
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
            
            // creates a button for creating a new group
            NavigationStack(path: $path) {
                NavigationLink {
                    CreateGroupView(showSignInView: $showSignInView)
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
            
            // shows a little message when the user has no groups yet
            if (viewModel.groups.count == 0) {
                VStack {
                    Text("You don't have any groups yet. \nStart by creating a new group with your friends!")
                    Spacer()
                }
            }
            if (viewModel.groups.count > 0){
                // shows list of all groups the user is part of
                List($viewModel.groups, id: \.self) { group in
                    let gr = group.wrappedValue
                    let groupId = gr.gid
                    NavigationLink(destination: MatchesView(groupId: groupId)){
                        GroupRowView(group: group)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
                .padding()
            }
        }
        // fetches all groups of the user when screen appears
        .onAppear {
            viewModel.fetchGroups()
        }
    }
}

#Preview {
    NavigationStack {
        GroupView(showSignInView: .constant(false))
    }
}

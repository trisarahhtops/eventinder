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
    @Binding var isShowingCreateGroupView: Bool
    
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
            
            NavigationStack(path: $path) {
                NavigationLink {
                    CreateGroupView(showSignInView: $showSignInView, isShowingCreateGroupView: $isShowingCreateGroupView)
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
            
            if (viewModel.groups.count == 0) {
                VStack {
                    Text("You don't have any groups yet. \nStart by creating a new group with your friends!")
                    Spacer()
                }
            }
            if (viewModel.groups.count > 0){
                // List of groups
                List($viewModel.groups, id: \.self) { group in
                    GroupRowView(group: group)
                }
                .scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchGroups()
        }
    }
}

#Preview {
    NavigationStack {
        GroupView(showSignInView: .constant(false), isShowingCreateGroupView: .constant(false))
    }
}

//
//  CreateGroupView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct CreateGroupView: View {
    @ObservedObject var viewModel = CreateGroupViewModel();
    @State private var searchText = ""
    @Binding var showSignInView: Bool
    @State var createGroupFinished: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // lets the user search for and choose users of the app to include in their new group
    var body: some View {
        VStack {
            // creates screen title
            Text("New Group")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            // lists all users of the app that are part of the search result
            List {
                ForEach(searchResults.indices, id: \.self) { index in
                    HStack {
                        // shows the username and whether the user has selected then to add to their group
                        Text("\(searchResults[index].username)")
                        Spacer()
                        Toggle("add", isOn: $viewModel.friends[index].isSelected)
                            .toggleStyle(.button)
                    }
                }
            }
            .listStyle(PlainListStyle())
            // creates a searchbar at the top to search the users in the list
            .searchable(text: $searchText)
            NavigationLink("select groupname") {
                CreateGroupProfileView(friends: viewModel.getFriendnames(), showSignInView: $showSignInView, createGroupFinished: $createGroupFinished)
            }
            .disabled(!viewModel.getIsSelected())
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
            .padding()
        }
        // if the group is created (in the next screen) this screen is dismissed and the user is redirected to the group view
        .onAppear{
            if createGroupFinished {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    // filters the user list to only include the usernames containing the search text
    // excludes the current user from the list
    var searchResults: [Friend] {
        if searchText.isEmpty {
            return viewModel.friends.filter { !$0.username.contains(UserData.shared.username) }
        } else {
            return viewModel.friends.filter { $0.username.contains(searchText) && !$0.username.contains(UserData.shared.username) }
        }
    }
}

#Preview {
    // attention: perview won't show the searchbar as it needs the navigationstack from contentview to work
    CreateGroupView(showSignInView: .constant(false))
}


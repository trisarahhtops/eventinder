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
    
    var body: some View {
        VStack {
            Text("New Group")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            NavigationStack {
                List {
                    ForEach(searchResults.indices, id: \.self) { index in
                        HStack {
                            Text("\(searchResults[index].username)")
                            Spacer()
                            Toggle("add", isOn: $viewModel.friends[index].isSelected)
                                .toggleStyle(.button)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            // TODO fix: search bar does not show when view is opened from contentview
            .searchable(text: $searchText)
            NavigationLink("select groupname") {
                CreateGroupProfileView(friends: viewModel.getFriendnames(), showSignInView: $showSignInView)
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
    }
    
    var searchResults: [Friend] {
        if searchText.isEmpty {
            return viewModel.friends
        } else {
            return viewModel.friends.filter { $0.username.contains(searchText) }
        }
    }
}
/*
#Preview {
    CreateGroupView(showSignInView: Binding<false>)
}
*/

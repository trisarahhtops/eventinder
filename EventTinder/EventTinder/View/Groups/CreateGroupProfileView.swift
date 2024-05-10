//
//  CreateGroupProfileView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 29.04.24.
//

import SwiftUI

struct CreateGroupProfileView: View {
    var friends: [String]
    @State private var groupPicture: String = "group1"
    @State private var groupname: String = ""
    private var smallProfileSize = UIScreen.main.bounds.width/4-24
    private var bigProfileSize = UIScreen.main.bounds.width-50
    @Binding var showSignInView: Bool

    public init(friends: [String], showSignInView: Binding<Bool>) {
        self.friends = friends
        self._showSignInView = showSignInView
        // TODO get username from database
        self.friends.append(UserData.shared.username)
    }
    
    var body: some View {
        VStack{
            Text("New Group")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Choose a group picture")
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Image(groupPicture, label: Text("Grouppicture"))
                .resizable()
                .frame(width: bigProfileSize, height: bigProfileSize)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Button {
                    groupPicture = "group1"
                } label: {
                    Image(.group1)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = "group2"
                } label: {
                    Image(.group2)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = "group3"
                } label: {
                    Image(.group3)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = "group4"
                } label: {
                    Image(.group4)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
            Text("Choose a group name")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            TextField("group name", text: $groupname)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            NavigationLink("Create Group") {
                GroupView(showSignInView: $showSignInView)
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
            .onTapGesture {
                Task {
                    do {
                        print("will add a group")
                        try await GroupsViewModel.shared.createNewGroup(group: group(gid: "someID", members: self.friends, name: self.groupname, pic: self.groupPicture))
                        print("added a group")
                    } catch {
                        print("Error while creating a new group: \(error)")
                    }
                }
            }
        }
        .padding(20)
    }
}

/*
#Preview {
    CreateGroupProfileView(friends: ["Klaus", "Günther", "Peter"], showSignInView: Binding<false>)
}
*/

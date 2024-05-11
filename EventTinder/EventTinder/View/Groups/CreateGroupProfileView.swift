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
    @Binding var createGroupFinished: Bool
    @Environment(\.presentationMode) var isShowingCreateGroupView: Binding<PresentationMode>

    // needed an initalizer to trigger adding the current user to the selected friend group
    public init(friends: [String], showSignInView: Binding<Bool>, createGroupFinished: Binding<Bool>) {
        self.friends = friends
        self._showSignInView = showSignInView
        self._createGroupFinished = createGroupFinished
        // get username from database
        self.friends.append(UserData.shared.username)
    }
    
    // lets the user choose one of 4 group pictures, a name and create the group
    var body: some View {
        VStack{
            // creates screen title
            Text("New Group")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            // shows current and 4 possible pictures to choose from
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
            // lets the user enter a group name
            Text("Choose a group name")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            TextField("group name", text: $groupname)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            // creates the group when button is triggered
            Button("Create Group") {
                Task {
                    do {
                        try await GroupsViewModel.shared.createNewGroup(members: self.friends, name: self.groupname, pic: self.groupPicture)
                        print("added a group")
                        createGroupFinished = true
                        // dismisses the screen and redirects the user back to groupview
                        self.isShowingCreateGroupView.wrappedValue.dismiss()
                    } catch {
                        print("Error while creating a new group: \(error)")
                    }
                }
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
        }
        .padding(20)
    }
}


#Preview {
    CreateGroupProfileView(friends: ["Klaus", "Günther", "Peter"], showSignInView: .constant(false), createGroupFinished: .constant(false))
}

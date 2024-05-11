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

    public init(friends: [String], showSignInView: Binding<Bool>, createGroupFinished: Binding<Bool>) {
        self.friends = friends
        self._showSignInView = showSignInView
        self._createGroupFinished = createGroupFinished
        // get username from database
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
            Button("Create Group") {
                Task {
                    do {
                        try await GroupsViewModel.shared.createNewGroup(members: self.friends, name: self.groupname, pic: self.groupPicture)
                        print("added a group")
                        createGroupFinished = true
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

/*
#Preview {
    CreateGroupProfileView(friends: ["Klaus", "Günther", "Peter"], showSignInView: Binding<false>)
}
*/

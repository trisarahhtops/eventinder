//
//  CreateGroupProfileView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 5/5/2024.
//

import SwiftUI

struct CreateGroupProfileView: View {
    @State private var groupPicture: Image = Image(.group1)
    @State private var groupname: String = ""
    private var smallProfileSize = UIScreen.main.bounds.width/4-24
    private var bigProfileSize = UIScreen.main.bounds.width-50

    var body: some View {
        VStack{
            Text("New Group")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Choose a group picture")
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            groupPicture
                .resizable()
                .frame(width: bigProfileSize, height: bigProfileSize)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Button {
                    groupPicture = Image(.group1)
                } label: {
                    Image(.group1)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = Image(.group2)
                } label: {
                    Image(.group2)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = Image(.group3)
                } label: {
                    Image(.group3)
                        .resizable()
                        .frame(width: smallProfileSize, height: smallProfileSize)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = Image(.group4)
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
                //TODO save groupname and create group in database
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
    CreateGroupProfileView()
}


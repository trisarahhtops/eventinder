//
//  CreateGroupProfileView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct CreateGroupProfileView: View {
    @State private var groupPicture: Image = Image(.group1)
    
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
                .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.width-40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Button {
                    groupPicture = Image(.group1)
                } label: {
                    Image(.group1)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4-16, height: UIScreen.main.bounds.width/4-16)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = Image(.group2)
                } label: {
                    Image(.group2)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4-16, height: UIScreen.main.bounds.width/4-16)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = Image(.group3)
                } label: {
                    Image(.group3)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4-16, height: UIScreen.main.bounds.width/4-16)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Button {
                    groupPicture = Image(.group4)
                } label: {
                    Image(.group4)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4-16, height: UIScreen.main.bounds.width/4-16)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
            NavigationLink("Create Group") {
                
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

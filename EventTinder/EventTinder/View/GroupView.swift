//
//  Groupview.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        VStack {
            Text("My Groups")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            List {
                
            }
            NavigationStack {
                NavigationLink("Profile") {
                    ProfileView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        GroupView()
    }
}

//
//  CreateGroupView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct CreateGroupView: View {
    // TODO change to friends of a person from a database
    private let names = ["Holly", "Josh", "Rhonda", "Ted"]
    // TODO add a selection variable for every single friend and change isSelected to a variable catching whether there is a selection at all
    @State var isSelected: Bool
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Text("New Group")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            NavigationStack {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        HStack {
                            Text(name)
                            Spacer()
                            Toggle("add", isOn: $isSelected)
                                .toggleStyle(.button)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            // TODO fix: search bar does not show when view is opened from contentview
            .searchable(text: $searchText)
            NavigationLink("select groupname") {
               // CreateGroupProfileView()
            }
            .disabled(!isSelected)
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
            .padding()
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    CreateGroupView(isSelected: false)
}

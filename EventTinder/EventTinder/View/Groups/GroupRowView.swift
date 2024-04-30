//
//  GroupRowView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct GroupRowView: View {
    var group: Group
    
    var body: some View {
        ZStack {
            if group.notification {
                Circle()
                    .frame(width: 14, height: 14, alignment: .leading)
                    .foregroundColor(.accentColor)
                    .padding(.trailing, 0)
                    .offset(x: (UIScreen.main.bounds.width/2 - 40))
            }
            HStack {
                group.image
                    .resizable()
                    .frame(width: 42, height: 42)
                VStack {
                    Text(group.groupName)
                        .font(.headline)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("You have \(group.numberOfMatches) matches.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
        }
    }
}

#Preview {
    GroupRowView(group: Group())
}

//
//  CategoryButton.swift
//  EventTinder
//
//  Created by Sarah Zhong on 5/5/2024.
//

import SwiftUI

struct CategoryButton: View {
    let systemName: String
    let title: String
    @Binding var filteredEvents: [Event]
    let events: [Event]
    
    var body: some View {
        Button(action: {
            filterEvents()
        }) {
            HStack {
                Image(systemName: systemName)
                Text(title)
            }
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundStyle(Color(.systemFill))
            }
            .font(.system(.footnote, weight: .medium))
        }
    }
    
    func filterEvents() {
        filteredEvents = events.filter { $0.eventCategory == title }
    }
}


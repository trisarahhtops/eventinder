//
//  EventView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 5/5/2024.
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack {
                // Display event details
                Text(event.eventName)
                    .font(.title)
                    .padding()
                Text("Date: \(event.eventDate)")
                    .font(.headline)
                    .padding()
                Text(event.eventDescription)
                    .font(.body)
                    .padding()
            }
        }
        .navigationBarTitle(Text(event.eventName), displayMode: .inline)
    }
}


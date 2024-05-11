//
//  MatchesRowView.swift
//  EventTinder
//
//  Created by Julia Eisele on 9/5/2024.
//

import SwiftUI

struct MatchesRowView: View {
    let id: String
    let event: Event
    
    init(id: String) {
        self.id = id
        event = MockData.events[Int(id)!]
    }
    
    //shows the event picture, name and date of a specific event. Used in MatchesView to create a list of matched events.
    var body: some View {
        HStack{
        //gets first picture, name and date from the MockData
            Image(event.imageURLs[0])
                .resizable()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            VStack{
                Text("\(event.eventName)")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Date: \(event.eventDate)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    MatchesRowView(id: "0")
}

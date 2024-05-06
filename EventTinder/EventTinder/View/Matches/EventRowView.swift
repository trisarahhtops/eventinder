//
//  EventRowView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 5/5/2024.
//
/*
import SwiftUI

struct EventRowView: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                // Image on the left-hand side
                eventImage
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.eventName)
                        .font(.headline)
                    
                    Text(event.eventDescription)
                        .font(.subheadline)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text(event.eventDate)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
            
            // Display matched users
            if !event.matchedUsers.isEmpty {
                Text("Matched with: \(event.matchedUsers.joined(separator: ", "))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
    
    private var eventImage: some View {
        if let imageURL = event.imageURLs.first {
            // Placeholder image if imageURLs array is empty
            Image(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

#if DEBUG
struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: MockData.events[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
#endif*/



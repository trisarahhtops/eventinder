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
                // Display event image
                eventImage
                    .frame(maxWidth: .infinity)
                
                // Display event details
                VStack(alignment: .leading, spacing: 16) {
                    Text(event.eventName)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.primary)
                    
                    Text("Date: \(event.eventDate)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                    Text(event.eventDescription)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }
                .padding(.vertical, 20)
                
                // Book Event Button
                Button(action: {
                    // Handle book event action
                }) {
                    Text("Book Event")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 1.000, green: 0.369, blue: 0.431))
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationBarTitle(Text(event.eventName), displayMode: .inline)
    }
    
    private var eventImage: some View {
        Image(event.imageURLs.first ?? "placeholder_image") // Use a placeholder image if imageURLs is empty
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 250)
            .clipped()
            .cornerRadius(15)
            .padding(.horizontal)
            .shadow(color: Color(.black).opacity(0.2), radius: 10, x: 0, y: 5)
    }
}





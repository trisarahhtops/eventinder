//
//  MatchesView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct MatchesView: View {
    @State private var filteredEvents: [Event] = []
    @State private var selectedSortOption = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("My Matches")
                        .font(.system(.title, weight: .bold))
                        .padding(.leading)
                    Spacer()
                }
                Picker("Sort By", selection: $selectedSortOption) {
                    Text("All").tag(0)
                    Text("Date").tag(1)
                    Text("Group").tag(2)
                    Text("Interest").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(filteredEvents) { event in
                    NavigationLink(destination: EventView(event: event)) {
                        EventRowView(event: event, showDaysUntilEvent: selectedSortOption == 1)
                    }
                }
                .listStyle(PlainListStyle())
                .onAppear {
                    filterEvents()
                }
            }
        }
        .onAppear {
            // Initialize filteredEvents with all events
            filteredEvents = MockData.events
        }
    }
    
    private func filterEvents() {
        if selectedSortOption == 1 { // Date filter
            filteredEvents = MockData.events.sorted { $0.eventDate < $1.eventDate }
        } else {
            // No need to filter or sort for other options
            filteredEvents = MockData.events
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}

struct EventRowView: View {
    var event: Event
    var showDaysUntilEvent: Bool
    
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
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .opacity(showDaysUntilEvent ? 0.5 : 1) // Make it semi-transparent when showing days until event
                        
                        Spacer() // Push the following views to the right edge
                        
                        if showDaysUntilEvent {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(red: 1.000, green: 0.369, blue: 0.431))
                                .frame(width: 100, height: 24) // Adjust the width to fit the text
                                .overlay(
                                    Text("In \(daysUntilEvent()) days")
                                        .foregroundColor(.white)
                                
                                )
                        }
                        
                        Button(action: {
                            // Handle book action
                        }) {
                            Text("Book")
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
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
    
    // Remaining code remains unchanged...



    
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
    
    private func daysUntilEvent() -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let eventDate = formatter.date(from: event.eventDate) else { return 0 }
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: currentDate, to: eventDate)
        return components.day ?? 0
    }
}

#if DEBUG
struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: MockData.events[0], showDaysUntilEvent: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
#endif









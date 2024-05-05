//
//  ExploreView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct ExploreView: View {
    
    @State var search = ""
    @State private var filteredEvents: [Event] = MockData.events
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Explore")
                            .font(.system(.largeTitle, weight: .bold))
                            .padding(.leading)
                        Spacer()
                    }
                    TextField("Search...", text: $search, onCommit: filterEvents)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(15)
                        .padding()
                    Spacer()
                        .frame(height: 15)
                        .clipped()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CategoryButton(systemName: "basketball.fill", title: "Sport", filteredEvents: $filteredEvents, events: MockData.events)
                            CategoryButton(systemName: "music.quarternote.3", title: "Music", filteredEvents: $filteredEvents, events: MockData.events)
                            CategoryButton(systemName: "fork.knife", title: "Food", filteredEvents: $filteredEvents, events: MockData.events)
                            CategoryButton(systemName: "rectangle.grid.3x2.fill", title: "Other", filteredEvents: $filteredEvents, events: MockData.events)
                        }
                        .padding(.horizontal)
                        .bold()
                    }

                    .padding(.bottom, 30)
                    HStack {
                        Text("Upcoming Events")
                        Spacer()
                    }
                    .padding(.horizontal)
                    .font(.system(.title3, weight: .bold))
                    
                    // Iterate over filtered events to display event cards in two columns
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                        ForEach(filteredEvents) { event in
                            NavigationLink(destination: EventView(event: event)) {
                                EventCard(event: event)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .navigationBarHidden(true) // Hide navigation bar when on ExploreView
                Spacer()
                    .frame(height: 108)
                    .clipped()
            }
        }
    }
    
    func filterEvents() {
        if search.isEmpty {
            filteredEvents = MockData.events
        } else {
            filteredEvents = MockData.events.filter { $0.eventName.localizedCaseInsensitiveContains(search) }
        }
    }
}

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

struct EventCard: View {
    let event: Event
    
    var body: some View {
        VStack(spacing: 0) {
            Image(event.imageURLs.first ?? "") // Assuming imageURLs contains at least one element
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                }
                .frame(height: 225, alignment: .bottom)
                .clipped()
            
            Text(event.eventName)
                .font(.system(.footnote, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
                .padding(.top, 16)
                .foregroundStyle(.black) // Make the text black
                
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(event.eventDate)
                    .foregroundStyle(.secondary)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.callout)
            }
            .padding(.top, 5)
            .font(.system(.caption2, weight: .semibold))
            .foregroundStyle(.black)
        }
        .frame(width: 160)
        .clipped()
        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

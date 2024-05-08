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
    @ObservedObject var viewModel = EventbriteAPIManagerViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Explore")
                            .font(.system(.title, weight: .bold))
                            .padding(.leading)
                            //.frame(maxWidth: .infinity, alignment: .leading)
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

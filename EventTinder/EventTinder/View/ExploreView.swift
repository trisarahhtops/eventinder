//
//  ExploreView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = EventbriteAPIManagerViewModel()
       
    var body: some View {
        VStack {
           if let eventData = viewModel.eventData {
               // Display events
               Text("Events: \(eventData)")
           } else {
               // Show loading indicator or error message
               Text("Loading...")
           }
        }
        .onAppear {
           // Fetch events when the view appears
           viewModel.fetchEvents()
        }
    }
}

#Preview {
    ExploreView()
}

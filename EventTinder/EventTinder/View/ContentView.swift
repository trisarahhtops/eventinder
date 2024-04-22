//
//  ContentView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct ContentView: View {
    @State public var tabViewSelection = 1
    
    var body: some View {
        VStack {
            TabView(selection: $tabViewSelection) {
                ExploreView()
                    .tabItem {
                        Label("explore", systemImage: "safari.fill")
                    }.tag(0)
                GroupView()
                    .tabItem {
                        Label("groups", systemImage: "person.3.fill")
                    }.tag(1)
                DecisionView()
                    .tabItem {
                        Label("decisions", systemImage: "hand.draw.fill")
                    }.tag(2)
                MatchesView()
                    .tabItem {
                        Label("matches", systemImage: "equal.circle.fill")
                    }.tag(2)
            }
        }
    }
}

#Preview {
    ContentView()
}

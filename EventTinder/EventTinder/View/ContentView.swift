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
                        Label("score board", systemImage: "list.number")
                    }.tag(0)
                GroupView()
                    .tabItem {
                        Label("game", systemImage: "gamecontroller")
                    }.tag(1)
                DecisionView()
                    .tabItem {
                        Label("settings", systemImage: "gearshape")
                    }.tag(2)
                MatchesView()
                    .tabItem {
                        Label("settings", systemImage: "gearshape")
                    }.tag(2)
            }
        }
    }
}

#Preview {
    ContentView()
}

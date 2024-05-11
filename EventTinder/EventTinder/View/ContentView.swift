//
//  ContentView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct ContentView: View {
    // sets default view as explore view
    @State public var tabViewSelection = 0
    @State private var showSignInView: Bool = false
    
    // create a main navigation view to enter one of the 3 tabs
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    // creates a tabbar with 3 items
                    TabView(selection: $tabViewSelection) {
                        ExploreView()
                            .tabItem {
                                Label("explore", systemImage: "safari.fill")
                            }.tag(0)
                        GroupView(showSignInView: $showSignInView)
                            .tabItem {
                                Label("groups", systemImage: "person.3.fill")
                            }.tag(1)
                        CardStackView()
                            .tabItem {
                                Label("decisions", systemImage: "hand.draw.fill")
                            }.tag(2)
                    }
                }
            }
        }
        // checks whether user is signed in when the app is opened
        .onAppear() {
            let authUser = try? AuthentificationViewModel.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        // opens the authentification screen if the user is not logged in already
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthentificationView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    ContentView()
}

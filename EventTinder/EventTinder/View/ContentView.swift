//
//  ContentView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct ContentView: View {
    @State public var tabViewSelection = 1
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
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
        .onAppear() {
            let authUser = try? AuthentificationViewModel.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
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

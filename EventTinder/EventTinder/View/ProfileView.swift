//
//  ProfileView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
                .bold()
            List {
                Button("Log Out") {
                    Task {
                        do {
                            try viewModel.signOut()
                        } catch {
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}

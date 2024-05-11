//
//  ProfileView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    // creates a profile screen where the user can manage their email and password and log out
    var body: some View {
        VStack {
            // creates screen title
            Text("Profile")
                .font(.title)
                .bold()
            // shows your username
            Text("your username: \(UserData.shared.username)")
                .font(.caption)
                .bold()
            // creates a sectioned list to seperate management and update of the profile
            List {
                Section {
                    // lets the user log out of their accounts
                    Button("Log Out") {
                        Task {
                            do {
                                try viewModel.signOut()
                                showSignInView = true
                            } catch {
                                print("Error \(error) while sign out")
                            }
                        }
                    }
                    // lets the user reset their password (they will receive a mail)
                    Button("Reset Password") {
                        Task {
                            do {
                                try await viewModel.resetPassword()
                                print("PASSWORD RESET!")
                            } catch {
                                print("Error \(error) while resetting the password")
                            }
                        }
                    }
                } header: {
                    Text("Manage Account")
                }
                // change account detail section
                changeDetailsSection
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(showSignInView: .constant(false))
    }
}

extension ProfileView {
    private var changeDetailsSection: some View {
        Section {
            // lets the user update their email
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Email CHANGED!")
                    } catch {
                        print("Error \(error) while changing the email")
                    }
                }
            }
            // lets users update their password
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Password CHANGED!")
                    } catch {
                        print("Error \(error) while changing the password")
                    }
                }
            }
        } header: {
            Text("Change account details")
        }
    }
}

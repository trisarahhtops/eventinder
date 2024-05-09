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
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
                .bold()
            Text("\($viewModel.username)")
                .font(.headline)
                .bold()
            List {
                Section {
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
            // TODO add another authentification before in order to change email and/or password
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

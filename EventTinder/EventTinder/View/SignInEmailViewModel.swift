//
//  SignUpEmailViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 26.04.24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var userExists: Bool = false
    @Published var success: Bool = false
    
    func signUp() async throws {
        checkUniqueUsername()
        
        if (!userExists) {
            // saves username to global UserData for further local use (profile, creategroup, etc.)
            UserData.shared.username = username
            
            // save new user to database
            let user = UserDB(uid: username, email: email, photoURL: nil, eventIds: [])
            try await UserManagerViewModel.shared.createNewUser(user: user)
            
            guard !email.isEmpty, !password.isEmpty else {
                print("No email or password found.")
                return
            }
            
            try await AuthentificationViewModel.shared.createUser(email: email, password: password)
            success = true
        }
    }
    
    func signIn() async throws {
        checkUniqueUsername()
        
        if (userExists) {
            guard !email.isEmpty, !password.isEmpty else {
                print("No email or password found.")
                return
            }
            
            try await AuthentificationViewModel.shared.signInUser(email: email, password: password)
            success = true
        }
    }
    
    func checkUniqueUsername() {

        // check whether username already exists
        userExists = false
        Task {
            let allUsers: [String] = await UserManagerViewModel.shared.getAllUserIds()
            for user in allUsers {
                if (user == username) {
                    print("username already exists")
                    userExists = true
                }
            }
        }
    }
}

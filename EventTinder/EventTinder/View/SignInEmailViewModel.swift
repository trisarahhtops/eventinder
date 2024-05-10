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
    
    func signUp() async throws {
        //UserManagerViewModel.shared.getAllUsernames(completion: <#T##([String]?, (any Error)?) -> Void#>)
        var allUsers: [String] = []
        for user in allUsers {
            if (user == username) {
                print("username already exists")
                userExists = true
                return
            }
        }
        
        // saves username to global UserData for further local use (profile, creategroup, etc.)
        UserData.shared.username = username
        
        // save new user to database
        let user = UserDB(uid: username, email: email, photoURL: nil, eventIds: nil)
        try await UserManagerViewModel.shared.createNewUser(user: user)
        
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthentificationViewModel.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthentificationViewModel.shared.signInUser(email: email, password: password)
    }
}

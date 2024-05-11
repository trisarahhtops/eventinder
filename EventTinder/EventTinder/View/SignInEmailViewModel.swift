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
    
    // tries to sign up the user if the username doesn't exist already
    func signUp() async throws {
        await checkUniqueUsername()
        
        if (!userExists) {
            // saves username to global UserData for further local use (profile, creategroup, etc.)
            UserData.shared.username = username
            
            // save new user to database
            let user = UserDB(uid: username, email: email, photoURL: "", eventIds: [], lastSwipedEvent: 16)
            try await UserManagerViewModel.shared.createNewUser(user: user)
            
            // checks whether user typed in an email and a password
            guard !email.isEmpty, !password.isEmpty else {
                print("No email or password found.")
                return
            }
            
            try await AuthentificationViewModel.shared.createUser(email: email, password: password)
            success = true
        } else {
            // if username already exists, try sign in
            try await signIn()
        }
        
        DecisionViewModel.shared.getAllEvents()
        print("\(DecisionViewModel.shared.decisionModels)")
    }
    
    // sign in of user
    func signIn() async throws {
        UserData.shared.username = username

        // checks whether user typed in an email and a password
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthentificationViewModel.shared.signInUser(email: email, password: password)
        success = true
    }
    
    // checks whether username is unique
    func checkUniqueUsername() async {
        // check whether username already exists
        userExists = false
        // gets all usernames from database
        let allUsers: [String] = await UserManagerViewModel.shared.getAllUserIds()
        // iterates through all usernames and check with typed in username
        for user in allUsers {
            if (user == username) {
                print("username already exists")
                userExists = true
            }
        }
    }
}

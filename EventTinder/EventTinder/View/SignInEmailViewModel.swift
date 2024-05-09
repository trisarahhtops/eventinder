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
    
    func signUp() async throws {
        // TODO save username
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

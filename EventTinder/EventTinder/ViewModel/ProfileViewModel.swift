//
//  ProfileViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var username: String = ""
    
    func signOut() throws {
        try AuthentificationViewModel.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthentificationViewModel.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthentificationViewModel.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await AuthentificationViewModel.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "Hello123"
        try await AuthentificationViewModel.shared.updatePassword(password: password)
    }
}

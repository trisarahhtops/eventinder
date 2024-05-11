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
        if(UserData.shared.username != ""){
            UserManagerViewModel.shared.saveLastSwipedEvent(userId: UserData.shared.username, lastSwipedEventId: DecisionViewModel.shared.decisionModels.count)
        }
        try AuthentificationViewModel.shared.signOut()
    }
    
    // resets the password and triggers an email to be send by the firebase auth service
    func resetPassword() async throws {
        let authUser = try AuthentificationViewModel.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthentificationViewModel.shared.resetPassword(email: email)
    }
    
    // lets the user update the email in the firebase auth model
    /*func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await AuthentificationViewModel.shared.updateEmail(email: email)
    }*/
    
    // lets the user update the password in the firebase auth model
    func updatePassword() async throws {
        let password = "Hello123"
        try await AuthentificationViewModel.shared.updatePassword(password: password)
    }
}

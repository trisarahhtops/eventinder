//
//  AuthentificationManagerViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import Foundation
import Firebase
import FirebaseAuth


struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    // creates a local authenticated user
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthentificationViewModel {
    // only creates a single object AuthentificationManagerViewModel
    static let shared = AuthentificationViewModel()
    
    private init() { }
    
    // gets the currently signed in authenticated user
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    // creates a user in the firebase authentication service
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    // sign in of a user in the firebase authentication service
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    // reset of a user password in the firebase authentication service with triggered email to reset it
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    // update of a user password in the firebase authentication service
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    // attention: is deprecated needs another handling
    // update of a user email in the firebase authentication service
    /*func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: email)
    }*/
    
    // sign out of a user from the firebase authentication service
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

//
//  UserManagerViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Codable {
    let uid: String
    let email: String?
    let photoURL: String?
    let eventIds: [String]?
}


final class UserManagerViewModel {
    static let shared = UserManagerViewModel()
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: User) async throws{
    //use to add a user to the database:
        //let user = User(userId: someString, email: optionalString, photoURL: optionalString, eventIds: optionalArray)
        //UserManager.shared.createnewUser(user: user)

        try userDocument(userId: user.uid).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> User {
    //uses an userID to get the data from the user. returns type struct User
        //use: try await UserManager.shared.getUser(userId: someString)
        
        let snapshot = try await userDocument(userId: userId).getDocument(as: User.self)
        return snapshot
    }
    

    
    func editUser(user: User) async throws {
        try userDocument(userId: user.uid).setData(from: user, merge: true)
    }
    
    func userLikesEvent(userId: String, eventId: String){
        userDocument(userId: userId).updateData(["eventIds": FieldValue.arrayUnion([eventId])])
    }
    
}

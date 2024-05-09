//
//  UserManagerViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserDB: Codable {
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
    
    func createNewUser(user: UserDB) async throws{
    //use to add a user to the database:
        //let user = User(userId: someString, email: optionalString, photoURL: optionalString, eventIds: optionalArray)
        //UserManager.shared.createnewUser(user: user)

        try userDocument(userId: user.uid).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> UserDB {
    //uses an userID to get the data from the user. returns type struct User
        //use: try await UserManager.shared.getUser(userId: someString)
        
        let snapshot = try await userDocument(userId: userId).getDocument(as: UserDB.self)
        return snapshot
    }
    

    
    func editUser(user: UserDB) async throws {
        try userDocument(userId: user.uid).setData(from: user, merge: true)
    }
    
    func userLikesEvent(userId: String, eventId: String){
        userDocument(userId: userId).updateData(["eventIds": FieldValue.arrayUnion([eventId])])
    }
    
    func getAllUsernames(completion: @escaping ([String]?, Error?) -> Void) -> [String] {
        var userIds: [String] = []
        
        userCollection.getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(nil, error)
            } else {
                for document in querySnapshot!.documents {
                    let userId = document.documentID
                    userIds.append(userId)
                }
                completion(userIds, nil)
            }
        }
        return userIds
    }
}

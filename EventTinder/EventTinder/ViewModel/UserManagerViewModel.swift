//
//  UserManagerViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User {
    let userId: String
    let email: String?
    let photoURL: String?
}


final class UserManagerViewModel {
    static let shared = UserManagerViewModel()
    
    func createNewUser(auth: AuthDataResultModel) async throws{
    //use to add a user to the database: UserManager.shared.createnewUser(auth: authDataResult)
        var userData: [String:Any] = ["user_Id" : auth.uid, "email": auth.email ?? "", "photoURL": auth.photoUrl ?? ""]
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> User {
    //uses an userID to get the data from the user. returns type struct User
    //use: try await UserManager.shared.getUser(userId: someString)
        
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        guard let data = snapshot.data(), let userId = data["user_id"] else {
            throw URLError(.badServerResponse)
        }
        let email = data["email"] as? String
        let photoURL = data["photoURL"] as? String
        
        return User(userId: userId as! String, email: email, photoURL: photoURL)
    }
    
}

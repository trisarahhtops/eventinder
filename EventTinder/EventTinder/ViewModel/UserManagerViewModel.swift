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
    let lastSwipedEvent: Int
}

final class UserManagerViewModel {
    static let shared = UserManagerViewModel() //so that the UserManagerViewModel is the same every time used
    
    //for faster and cleaner useage
    private let userCollection = Firestore.firestore().collection("users")
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: UserDB) async throws{
    //adds a new user to the database
        try userDocument(userId: user.uid).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> UserDB {
    //uses an userID to get the data from the user. returns type User
        let snapshot = try await userDocument(userId: userId).getDocument(as: UserDB.self)
        return snapshot
    }
    
    func getLastSwipedEvent(userId:String) async -> Int{
        //returns the ID of the event the user last swiped/clicked on. Used in DecisionViewModel to only show the events the user has not decided on yet
        do{
            return try await getUser(userId: userId).lastSwipedEvent
        } catch {
            return 16
        }
    }
    
    func saveLastSwipedEvent(userId: String, lastSwipedEventId: Int){
        //saves the ID of the last swiped/clicked event. Used when user logs out so that when the user logs in again they only see events they have not decided on yet
        userDocument(userId: userId).updateData(["lastSwipedEvent": lastSwipedEventId])
    }
    
    func editUser(user: UserDB) async throws {
        //to change attributes of user saved in the database (e.g. email)
        try userDocument(userId: user.uid).setData(from: user, merge: true)
    }
    
    func userLikesEvent(userId: String, eventId: String){
        //adds an event ID to the saved likes of a user. Used when user likes an event.
        userDocument(userId: userId).updateData(["eventIds": FieldValue.arrayUnion([eventId])])
    }
    
    func getAllUserIds() async -> [String] {
        //returns all exisiting userIDs
        var userIds: [String] = []
        do {
        //gets all user documents and saves the ID to an array that is returned later
          let querySnapshot = try await userCollection.getDocuments()
          for document in querySnapshot.documents {
              userIds.append(document.documentID)
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        return userIds
    }
}

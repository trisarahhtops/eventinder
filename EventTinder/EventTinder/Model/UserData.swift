//
//  UserData.swift
//  EventTinder
//
//  Created by Amelie Patzer on 10.05.24.
//

import Foundation

// saves the username to be accessible in all views
final class UserData: ObservableObject  {
    static let shared = UserData()
    @Published var username: String = ""
}

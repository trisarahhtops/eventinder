//
//  ProfileViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthentificationViewModel.shared.signOut()
    }
}

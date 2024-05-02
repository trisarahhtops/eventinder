//
//  GroupsViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 2/5/2024.
//

import Foundation
import Firebase

func searchUser(username: String){
    let userSearch = username
    baseRef.child("users").queryOrdered(byChild: "username").queryStarting(atValue: userSearch).queryEnding(atValue: userSearch + "\u{f8ff}").observeSingleEvent(of: .value, with: {(snapshot in
    print(snapshot)
    )})
}

//
//  Group.swift
//  EventTinder
//
//  Created by Amelie Patzer on 27.04.24.
//

import Foundation
import SwiftUI

final class Group {
    var groupName: String
    var notification: Bool
    private var imageName: Image?
    var image: Image
    var numberOfMatches: Int
    
    init() {
        self.groupName = "Some Group"
        self.image = Image(systemName: "person.2.circle")
        self.notification = true
        self.numberOfMatches = 0
    }
}

extension Group: Identifiable {}

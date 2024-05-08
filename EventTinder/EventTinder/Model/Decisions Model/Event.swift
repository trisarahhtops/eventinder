//
//  Event.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation

struct Event: Identifiable, Hashable {
    let id: String
    let eventName: String
    let eventDate: String
    let eventDescription: String
    let eventCategory: String
    var imageURLs: [String]
}

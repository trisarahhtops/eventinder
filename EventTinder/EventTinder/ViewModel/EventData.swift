//
//  EventData.swift
//  EventTinder
//
//  Created by Amelie Patzer on 01.05.24.
//

import Foundation

import Foundation

struct EventData: Decodable {
    let name: String
    let main: Main
    let events: [Event]
}

struct Main: Decodable {
    let temp: Double
}

struct Event: Decodable, Identifiable, Hashable {
    let id: String
    let eventName: String
    let eventDate: String
    let eventDescription: String
    let eventCategory: String
    var imageURLs: [String]
    var matchedUsers: [String] // Array of matched users
}

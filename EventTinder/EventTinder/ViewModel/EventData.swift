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

struct Event: Decodable {
    let name: String
    let description: String
    let start: String
    let end: String
}
//
//  MockData.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation

struct MockData {
    static let events: [Event] = [
        Event(id: "1", eventName: "Event 1", eventDate: "2024-04-28", eventDescription: "Description 1", imageURLs: ["Cafe", "Hike"]),
        Event(id: "2", eventName: "Event 2", eventDate: "2024-04-29", eventDescription: "Description 2", imageURLs: ["Bar", "Hike"]),
                // Add more events as needed
            ]
        }

        /*.init(
            id: NSUUID().uuidString,
            eventName: "Cafe Hopping",
            eventDate: "24th May 2024",
            eventDescription: "Cafe hopping with friends blah blah",
            imageURLs: ["Cafe"]
             ),
        .init(
            id: NSUUID().uuidString,
            eventName: "Bar",
            eventDate: "25th May 2024",
            eventDescription: "Bar with friends blah blah",
            imageURLs: ["Bar"]
             ),
        .init(
            id: NSUUID().uuidString,
            eventName: "Hike",
            eventDate: "26th May 2024",
            eventDescription: "Hike with friends blah blah",
            imageURLs: ["Hike"]
             ),
    ]
}*/

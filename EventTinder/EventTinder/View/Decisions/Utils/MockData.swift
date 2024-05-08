//
//  MockData.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation

struct MockData {
    static let events: [Event] = [
        Event(id: "0", eventName: "Event 1", eventDate: "2024-04-28", eventDescription: "Description 1: Join us at AP Bakery for an enriching afternoon filled with delightful conversations over steaming cups of coffee. Whether you're a coffee connoisseur or simply love the aroma of freshly brewed coffee, this event promises to be a treat for your senses.", eventCategory: "Food", imageURLs: ["Cafe", "Hike"]),
        Event(id: "1", eventName: "Event 2", eventDate: "2024-04-29", eventDescription: "Description 2", eventCategory: "Music", imageURLs: ["Bar", "Hike"]),
        Event(id: "2", eventName: "Event 3", eventDate: "2024-04-30", eventDescription: "Description 3", eventCategory: "Sport", imageURLs: ["Hike", "Hike"]),
        Event(id: "3", eventName: "Event 4", eventDate: "2024-05-01", eventDescription: "Description 4", eventCategory: "Sport", imageURLs: ["Bar", "Bar"]),
    ]
}

/* struct Event {
 let id: String
 let eventName: String
 let eventDate: String
 let eventDescription: String
 let eventCategory: String
 var imageURLs: [String]

 init(id: String, eventName: String, eventDate: String, eventDescription: String, eventCategory: String, imageURLs: [String]) {
     self.id = id
     self.eventName = eventName
     self.eventDate = eventDate
     self.eventDescription = eventDescription
     self.eventCategory = eventCategory
     self.imageURLs = imageURLs
 }
}
*/

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

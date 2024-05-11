//
//  MockData.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation


//16 events as mock data. Every event has an id, nam, date, description, category and at least two pictures.
//only in use until an API (e.g. Eventbrite API) is included

struct MockData {
    static let events: [Event] = [
        Event(id: "0", eventName: "Jazz Night Roost", eventDate: "2024-06-15", eventDescription: "Join us for a night filled with smooth jazz melodies and soulful rhythms at The Roost. Sit back, relax, and let the music transport you to a world of tranquility and joy.", eventCategory: "Music", imageURLs: ["jazz1", "jazz3"]),
        Event(id: "1", eventName: "Food Truck Fiesta", eventDate: "2024-07-03", eventDescription: "Savor the flavors of the world at our Food Truck Fiesta! Indulge in a culinary adventure with a variety of cuisines ranging from spicy street tacos to decadent desserts. Bring your appetite and enjoy the vibrant atmosphere!", eventCategory: "Food", imageURLs: ["foodtruck2", "foodtruck"]),
        Event(id: "2", eventName: "Hiking Expedition", eventDate: "2024-08-20", eventDescription: "Embark on a thrilling hiking expedition with Trailblazers! Discover hidden trails, majestic landscapes, and breathtaking views. Whether you're a seasoned hiker or a novice adventurer, there's something for everyone!", eventCategory: "Other", imageURLs: ["hiking1", "Hike"]),
        Event(id: "3", eventName: "Soccer Showdown", eventDate: "2024-09-10", eventDescription: "Get ready for an adrenaline-pumping soccer showdown! Cheer for your favorite team, witness spectacular goals, and experience the thrill of victory. Bring your friends and join us for an unforgettable match!", eventCategory: "Sport", imageURLs: ["soccer1", "soccer2"]),
        Event(id: "4", eventName: "Pasta Masterclass", eventDate: "2024-10-05", eventDescription: "Learn the art of pasta-making from our expert chefs! Join us for a hands-on culinary masterclass where you'll discover the secrets behind crafting perfect pasta dishes. From silky fettuccine to flavorful ravioli, unleash your inner chef and impress your friends and family!", eventCategory: "Food", imageURLs: ["course1", "noodel1", "noodle3", "noodle"]),
        Event(id: "5", eventName: "Rock Concert", eventDate: "2024-11-12", eventDescription: "Rock out with us at the Concert Extravaganza! Experience electrifying performances, pulsating beats, and unforgettable moments. Whether you're a hardcore rocker or simply love great music, this event promises an unforgettable night of pure energy and excitement!", eventCategory: "Music", imageURLs: ["rock", "rock2", "rock4"]),
        Event(id: "6", eventName: "Yoga Retreat", eventDate: "2024-12-01", eventDescription: "Escape the hustle and bustle of the city and reconnect with nature at our Yoga Retreat. Immerse yourself in serene surroundings, rejuvenate your mind and body with daily yoga sessions, and rediscover inner peace. Join us for a transformative experience that will leave you feeling refreshed and revitalized!", eventCategory: "Other", imageURLs: ["yoga", "yoga1"]),
        Event(id: "7", eventName: "Basketball Bonanza", eventDate: "2025-01-20", eventDescription: "Shoot some hoops and slam dunk your way to victory at our Basketball Bonanza! Whether you're a seasoned player or just looking to have fun, our tournament promises excitement, competition, and plenty of high-flying action. Lace up your sneakers and join us on the court!", eventCategory: "Sport", imageURLs: ["basketball2", "basketball4"]),
        Event(id: "8", eventName: "Wine Tasting", eventDate: "2025-02-14", eventDescription: "Sip, swirl, and savor an exquisite selection of wines at our Tasting Soiree. From rich reds to crisp whites, indulge your palate with a curated tasting experience led by our knowledgeable sommeliers. Cheers to good company and great wines!", eventCategory: "Food", imageURLs: ["wine", "wine1", "wine3"]),
        Event(id: "9", eventName: "Star Symphony", eventDate: "2025-03-08", eventDescription: "Experience the magic of music under the twinkling stars at our Symphony Concert. Join us for an enchanting evening filled with classical masterpieces, captivating performances, and breathtaking views. Let the music carry you away on a journey of beauty and wonder!", eventCategory: "Music", imageURLs: ["classic", "orchestra", "music"]),
        Event(id: "10", eventName: "Sushi Masterclass", eventDate: "2025-04-25", eventDescription: "Roll up your sleeves and master the art of sushi-making at our Cooking Class! Learn to prepare delicious sushi rolls, nigiri, and sashimi from our expert chefs. Discover the techniques, ingredients, and flavors that make sushi a culinary delight!", eventCategory: "Food", imageURLs: ["course2", "sushi", "sushi2"]),
        Event(id: "11", eventName: "Photography Workshop", eventDate: "2025-05-15", eventDescription: "Capture the beauty of the great outdoors with our Adventure Photography Workshop. Learn essential photography skills, composition techniques, and tips for shooting in natural light. Whether you're a beginner or enthusiast, join us for a hands-on learning experience amidst stunning landscapes!", eventCategory: "Other", imageURLs: ["camera", "camera1"]),
        Event(id: "12", eventName: "Football Fan Fest", eventDate: "2025-06-22", eventDescription: "Join us for the ultimate Football Fan Fest! Watch live matches on big screens, enjoy delicious food and drinks, and immerse yourself in the electrifying atmosphere. Whether you're rooting for your favorite team or just love the game, this event is a must-attend for football fans!", eventCategory: "Sport", imageURLs: ["fans", "fans2"]),
        Event(id: "13", eventName: "Brunch Buffet", eventDate: "2025-07-10", eventDescription: "Indulge in a farm-fresh feast at our Brunch Buffet! Enjoy a delectable spread of seasonal dishes made from locally sourced ingredients. From hearty breakfast classics to farm-to-table favorites, savor every bite in the cozy ambiance of our restaurant.", eventCategory: "Food", imageURLs: ["buffet", "breakfast2"]),
        Event(id: "14", eventName: "Latin Dance Night", eventDate: "2025-08-18", eventDescription: "Get ready to move and groove at our Latin Dance Night! Join us for an evening of salsa, merengue, and bachata, led by professional instructors. Whether you're a seasoned dancer or just starting out, let the rhythm take control and dance the night away!", eventCategory: "Music", imageURLs: ["dance", "salsa"]),
        Event(id: "15", eventName: "Morning R&B", eventDate: "2025-09-05", eventDescription: "Kickstart your day with a refreshing morning run followed by a delicious brunch! Join us for a scenic run through the city streets or along picturesque trails, then refuel with a hearty brunch featuring energizing treats and refreshing drinks. Whether you're a seasoned runner or just getting started, this event is perfect for fitness enthusiasts and food lovers alike!", eventCategory: "Sport", imageURLs: ["run", "Cafe"])
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

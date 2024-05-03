//
//  EventbriteAPIManagerViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 01.05.24.
//

import Foundation

class EventbriteAPIManagerViewModel: ObservableObject {
    @Published var eventData: EventData?
    
    let eventbriteURL = "https://www.eventbriteapi.com/v3/"
    let APIKey = "MSFWRMCLMXKPJC3SHTGB"
    let token = ""
    
    func fetchEvents() {
        let urlString = "\(eventbriteURL)events/search/?token=\(token)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                if let safeData = data {
                    self.parseJSON(eventData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(eventData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(EventData.self, from: eventData)
            DispatchQueue.main.async {
                self.eventData = decodedData
            }
        } catch {
            print(error)
        }
    }
}

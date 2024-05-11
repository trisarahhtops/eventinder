//
//  EventbriteAPIManagerViewModel.swift
//  EventTinder
//
//  Created by Amelie Patzer on 01.05.24.
//

import Foundation
import SwiftUI

// this viewmodel is currently not used since the redirection URI does not work
class EventbriteAPIManagerViewModel: ObservableObject {
    @Published var eventData: EventData?
    
    let eventbriteURL = "https://www.eventbriteapi.com/v3/"
    let APIKey = "P7GBWMC6VXGVPRUT74"
    let clientSecret = "ZUBBMJILT3NTONKZAUNQJRZFZZIO63JZOZK2UOCAZLIANUJF4F"
    let redirectURI = "http://localhost:8080/oauth/redirect"
    var accessToken: String?
    
    // authorizes the user via login into eventbrite to receive a token
    func authorizeUser(completion: @escaping (Bool) -> Void) {
        let authorizationURL = "https://www.eventbrite.com/oauth/authorize?response_type=code&client_id=\(APIKey)&redirect_uri=\(redirectURI)"
        guard let url = URL(string: authorizationURL) else {
            print("Invalid authorization URL")
            completion(false)
            return
        }
        
        // Open URL in Safari or use SFSafariViewController to open within the app to autorize user via eventbrite
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url) { success in
                if success {
                    print("Opened authorization URL successfully")
                } else {
                    print("Failed to open authorization URL")
                    completion(false)
                }
            }
        } else {
            print("Cannot open authorization URL")
            completion(false)
        }
    }
    
    // requests an access token for the user
    func requestAccessToken(with accessCode: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://www.eventbrite.com/oauth/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let postData = "grant_type=authorization_code&client_id=\(APIKey)&client_secret=\(clientSecret)&code=\(accessCode)&redirect_uri=\(redirectURI)"
        request.httpBody = postData.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(false)
                return
            }
            guard (200...299).contains(response.statusCode) else {
                print("Status code: \(response.statusCode)")
                completion(false)
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let accessToken = json["access_token"] as? String {
                    self?.accessToken = accessToken
                    completion(true)
                } else {
                    print("Error parsing access token")
                    completion(false)
                }
            } catch {
                print("Error parsing JSON: \(error)")
                completion(false)
            }
        }
        
        task.resume()
    }
    
    // gets all events via eventbrite API
    func fetchEvents() {
        authorizeUser { [weak self] success in
            guard success else {
                print("Failed to authorize user")
                return
            }
            guard let accessToken = self?.accessToken else {
                print("Access token is nil")
                return
            }
            let urlString = "\(self?.eventbriteURL ?? "")events/search/?token=\(accessToken)"
            self?.performRequest(urlString: urlString)
        }
    }
    
    // sends the given request to the given url and processes the received JSON file
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
    
    // decodes the JSON into an eventData model
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

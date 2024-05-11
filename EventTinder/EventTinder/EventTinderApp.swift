//
//  EventTinderApp.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI
import Firebase

@main
struct EventTinderApp: App {
    
    // registers app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        // starts app view
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}


// since eventbrite is not currently not intergrated the following code is not used
// preparation for future eventbrite integration
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    let viewModel = EventbriteAPIManagerViewModel()
    
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
    }
    
    // Handle URL redirection
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("is being redirected")
        // Check if the URL is from Eventbrite's authorization redirect
        guard url.scheme == viewModel.redirectURI else {
            // Handle other URL schemes if needed
            return false
        }
        
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
            print("Invalid redirect URI")
            return false
        }
        
        // Request access token with the obtained code using your view model
        viewModel.requestAccessToken(with: code) { success in
            if success {
                // Authorization successful, handle as needed
                print("Authorization successful")
            } else {
                // Authorization failed, handle as needed
                print("Authorization failed")
            }
        }
        
        return true
    }
}

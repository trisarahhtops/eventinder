//
//  AuthentificationView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 26.04.24.
//

import SwiftUI

// displays the possible ways to Login/SignUp to the app
struct AuthentificationView: View {
    @Binding var showSignInView: Bool
    
    // creates an authentification view with options to sign in
    // optional future implementation of other sign in methods like google, eventbrite, apple etc.
    var body: some View {
        VStack {
            // creates screen title
            Text("Sign Up")
                .font(.title)
                .bold()
            // creates button for email sign in
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign Up via Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        AuthentificationView(showSignInView: .constant(false))
    }
        
}

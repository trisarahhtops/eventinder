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
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .bold()
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign Up via Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
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

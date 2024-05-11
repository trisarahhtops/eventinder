//
//  SignUpEmailView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 26.04.24.
//

import SwiftUI

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    // creates a standard login screen with 3 textfields and a button
    var body: some View {
        VStack {
            // creates the screen title
            Text("Sign in via Email")
                .font(.title)
                .bold()
            // creates username, email, password textfields
            TextField("Username...", text: $viewModel.username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .foregroundColor(viewModel.userExists ? .red : .gray)
                .cornerRadius(10)
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            // creates a button to sign in the user
            Button {
                Task {
                    // tries to sign up the user and create a new account
                    // signs in the user if there already is an account there
                    do {
                        try await viewModel.signUp()
                        // closes the sign in view when user is logged in
                        showSignInView = !viewModel.success
                        return
                    } catch {
                        print("Error: \(error), while signing up")
                    }
                    print("\(viewModel.success)")
                }
            } label: {
                Text("Sign in")
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
        SignInEmailView(showSignInView: .constant(false))
    }
}

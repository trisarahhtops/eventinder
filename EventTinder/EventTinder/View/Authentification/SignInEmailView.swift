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
    
    var body: some View {
        VStack {
            Text("Sign in via Email")
                .font(.title)
                .bold()
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
            Button {
                Task {
                    // tries to sign up the user and create a new account
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print("Error: \(error), while signing up")
                    }
                    // signs in the user if there already is an account there
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print("Error: \(error), while signing in")
                    }
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

//
//  SignUpEmailView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 26.04.24.
//

import SwiftUI

struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpEmailViewModel()
    
    var body: some View {
        VStack {
            Text("Sign Up via Email")
                .font(.title)
                .bold()
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            Button {
                //viewModel.signIn()
            } label: {
                Text("Sign Up")
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
        SignUpEmailView()
    }
}

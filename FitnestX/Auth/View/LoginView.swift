//
//  LoginView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var auth : RegistrationAuth
    
    @Binding  var authMode: AuthFormView.AuthMode
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isChecked = true
    @State private var navigateToMainTab = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        AuthFormView(mode: .login,
                     fields: [
                        AuthField(text: $email, placeholder: "Email", imageName: "Message"),
                        AuthField(text: $password, placeholder: "Password", imageName: "Lock", isSecure: true)],
                     isChecked: .constant(false)) {
            auth.login(email: email, password: password) { result in
                switch result {
                case .success:
                    navigateToMainTab = true
                case .failure(let error):
                    alertMessage = error.localizedDescription
                    showAlert = true
                }
            }
        } secondaryAction: {
            authMode = .register
        }
        .alert("Login Failed", isPresented: $showAlert) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
        .navigationDestination(isPresented: $navigateToMainTab) {
            MainTabView()
                .environmentObject(auth)  
                .navigationBarBackButtonHidden()
        }

    }
}

#Preview {
    LoginView(authMode: .constant(.login))
        .environmentObject(RegistrationAuth())
}

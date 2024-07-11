//
//  LoginView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct LoginView: View {
    @Binding  var authMode: AuthFormView.AuthMode
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isChecked = true
    var body: some View {
        AuthFormView(mode: .login,
                     fields: [
                        AuthField(text: $email, placeholder: "Email", imageName: "Message"),
                        AuthField(text: $password, placeholder: "Password", imageName: "Lock", isSecure: true)],
                     isChecked: .constant(false)) {
            
        } secondaryAction: {
            authMode = .register
        }
        
        
        

    }
}

#Preview {
    LoginView(authMode: .constant(.login))
}

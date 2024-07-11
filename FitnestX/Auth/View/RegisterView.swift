//
//  RegisterView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct RegisterView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isTapped = false
    @State private var isChecked = false
    @Binding  var authMode: AuthFormView.AuthMode
    
    //    @AppStorage private var registerPageComplete: Bool
    var body: some View {
        AuthFormView(mode: .register,
                     fields: [
                        AuthField(text: $firstName, placeholder: "First Name", imageName: "Profile"),
                        AuthField(text: $lastName, placeholder: "Last Name", imageName: "Profile"),
                        AuthField(text: $email, placeholder: "Email", imageName: "Message"),
                        AuthField(text: $password, placeholder: "Password", imageName: "Lock", isSecure: true)
                     ],
                     isChecked: $isChecked) {
            //Ischecked Logic
        } secondaryAction: {
            print("Switching to register mode")
            authMode = .login
        }
        
        
    }
    
    
}

#Preview {
    RegisterView(authMode: .constant(.register))
}

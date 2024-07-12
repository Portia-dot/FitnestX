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
    @State private var showProfileDetails = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding  var authMode: AuthFormView.AuthMode
    
    //Helper
    @StateObject private var helper = RegistrationHelper()
    
    //    @AppStorage private var registerPageComplete: Bool
    var body: some View {
        AuthFormView(mode: .register,
                     fields: [
                        
                        AuthField(text: $email, placeholder: "Email", imageName: "Message"),
                        AuthField(text: $password, placeholder: "Password", imageName: "Lock", isSecure: true),
                        AuthField(text: $firstName, placeholder: "First Name", imageName: "Profile"),
                        AuthField(text: $lastName, placeholder: "Last Name", imageName: "Profile")
                     ],
                     isChecked: $isChecked) {
            //Ischecked Logic
            if helper.validateFields(firstName: firstName, lastName: lastName, email: email, password: password, isChecked: isChecked) {
                helper.saveRegistrationDetails(firstName: firstName, lastName: lastName, email: email, isChecked: isChecked)
                showProfileDetails = true
            }else{
                helper.showAlert = true
            }
            
        } secondaryAction: {
            authMode = .login
        }
        .navigationDestination(isPresented: $showProfileDetails){
            ProfileDetails()
        }
        .alert("Invalid Input", isPresented: $showAlert){
            Button("Ok", role: .cancel){}
        }message: {
            Text(alertMessage)
        }
        .onAppear{
            helper.loadRegistrationDetails(firstName: &firstName, lastName: &lastName, email: &email, isChecked: &isChecked)
        }
    }
    
    

}

#Preview {
    RegisterView(authMode: .constant(.register))
}

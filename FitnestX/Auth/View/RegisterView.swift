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
            if validateFields() {
                saveRegistrationDetails()
                showProfileDetails = true
            }else{
                showAlert = true
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
    }
    
    //Validate Email
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    //Valid Password
    private func isValidPassword(_ password: String) -> Bool {
          let passwordRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{8,}"
          let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
          return passwordPred.evaluate(with: password)
      }
    
    //Validate Fields
    private func validateFields() -> Bool {
        if firstName.count < 2 {
            alertMessage = "First name must be at least 2 characters long"
            return false
        }
        if lastName.count < 2 {
            alertMessage = "Last name must be at least 2 characters long"
            return false
        }
        if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address"
            return false
        }
        if !isValidPassword(password){
            alertMessage = "Password must have more than 8 characters, contain some special character, one digit, one uppercase letter"
            return false
        }
        if !isChecked {
            alertMessage = "You must agree to the terms and conditions."
            return false
        }
        return true
    }
    
    
    //Save the file locally
    
    private func saveRegistrationDetails() {
          UserDefaults.standard.set(firstName, forKey: "firstName")
          UserDefaults.standard.set(lastName, forKey: "lastName")
          UserDefaults.standard.set(email, forKey: "email")
          UserDefaults.standard.set(isChecked, forKey: "isChecked")
          UserDefaults.standard.set(showProfileDetails, forKey: "showProfileDetails")
      }
    
}

#Preview {
    RegisterView(authMode: .constant(.register))
}

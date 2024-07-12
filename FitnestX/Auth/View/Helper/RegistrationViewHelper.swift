//
//  RegistrationViewHelper.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

class RegistrationHelper: ObservableObject {
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{8,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }

    func validateFields(firstName: String, lastName: String, email: String, password: String, isChecked: Bool) -> Bool {
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
        if !isValidPassword(password) {
            alertMessage = "Password must have more than 8 characters, contain some special character, one digit, one uppercase letter"
            return false
        }
        if !isChecked {
            alertMessage = "You must agree to the terms and conditions."
            return false
        }
        return true
    }

    func loadRegistrationDetails(firstName: inout String, lastName: inout String, email: inout String, isChecked: inout Bool) {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        isChecked = UserDefaults.standard.bool(forKey: "isChecked")
    }

    func saveRegistrationDetails(firstName: String, lastName: String, email: String, isChecked: Bool) {
        UserDefaults.standard.set(firstName, forKey: "firstName")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(isChecked, forKey: "isChecked")
    }
}


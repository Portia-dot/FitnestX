//
//  ProfileHelper.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI
import FirebaseFirestore

class ProfileDetailsHelper: ObservableObject {
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    func validateFields(selectedGender: String, weight: String, height: String) -> Bool {
        if selectedGender.isEmpty || selectedGender == "Choose Gender" {
            alertMessage = "Please select a gender"
            return false
        }
        if weight.isEmpty {
            alertMessage = "Please enter your weight"
            return false
        }
        if height.isEmpty {
            alertMessage = "Please enter your height"
            return false
        }
        return true
    }
    
    func toggleWeightUnit(weight: inout String, weightUnit: inout String) {
        guard let currentWeight = Double(weight) else { return }
        
        if weightUnit == "KG" {
            weightUnit = "LB"
            weight = String(format: "%.2f", currentWeight * 2.20462)
        } else {
            weightUnit = "KG"
            weight = String(format: "%.2f", currentWeight / 2.20462)
        }
    }
    
    func toggleHeightUnit(height: inout String, heightUnit: inout String) {
        guard let currentHeight = Double(height) else { return }
        
        if heightUnit == "CM" {
            heightUnit = "FT+IN"
            let totalInches = currentHeight / 2.54
            let feet = Int(totalInches / 12)
            let inches = totalInches.truncatingRemainder(dividingBy: 12)
            height = "\(feet)'\(String(format: "%.2f", inches))\""
        } else {
            heightUnit = "CM"
            let components = height.split(separator: "'")
            if components.count == 2,
               let feet = Double(components[0]),
               let inches = Double(components[1].replacingOccurrences(of: "\"", with: "")) {
                let totalCm = (feet * 30.48) + (inches * 2.54)
                height = String(format: "%.2f", totalCm)
            }
        }
    }

    
    func loadRegistrationDetails(firstName: inout String, lastName: inout String, email: inout String, password: inout String, isChecked: inout Bool) {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        password = UserDefaults.standard.string(forKey: "password") ?? ""
        isChecked = UserDefaults.standard.bool(forKey: "isChecked")
    }
    
    func registerUser(email: String, password: String, firstName: String, lastName: String, gender: String, dateOfBirth: Date, weight: String, height: String, weightUnit: String, heightUnit: String, completion: @escaping (Result<Void, Error>) -> Void) {
        RegistrationAuth.shared.registerUser(email: email, password: password, firstName: firstName, lastName: lastName, gender: gender, dateOfBirth: dateOfBirth, weight: weight, height: height, weightUnit: weightUnit, heightUnit: heightUnit) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.alertMessage = "Profile successfully completed"
                    self.showAlert = true
                    completion(.success(()))
                case .failure(let error):
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                    completion(.failure(error))
                }
            }
        }
    }
    
    func clearUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "firstName")
        defaults.removeObject(forKey: "lastName")
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "isChecked")
        defaults.removeObject(forKey: "password")
        defaults.removeObject(forKey: "showProfileDetails")
    }
}

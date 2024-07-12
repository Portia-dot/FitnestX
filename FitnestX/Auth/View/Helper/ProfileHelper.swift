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
            heightUnit = "FT"
            height = String(format: "%.2f", currentHeight / 30.48)
        } else {
            heightUnit = "CM"
            height = String(format: "%.2f", currentHeight * 30.48)
        }
    }

    func loadRegistrationDetails(firstName: inout String, lastName: inout String, email: inout String, isChecked: inout Bool) {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
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
}

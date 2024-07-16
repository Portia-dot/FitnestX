//
//  User.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-13.
//

import SwiftUI
import Firebase

struct User: Decodable {
    var firstName: String
    var lastName: String
    var email: String
    var gender: String
    var height: String
    var heightUnit: String
    var weight: String
    var weightUnit: String
    var uid: String
    var dateOfBirth: Date
    
    var age: Int {
        let calender = Calendar.current
        let now = Date()
        let ageComponents =  calender.dateComponents([.year], from: dateOfBirth, to: now)
        return ageComponents.year ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName, lastName, email, gender, height, heightUnit, uid, weight, weightUnit, dateOfBirth
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        gender = try container.decode(String.self, forKey: .gender)
        height = try container.decode(String.self, forKey: .height)
        heightUnit = try container.decode(String.self, forKey: .heightUnit)
        uid = try container.decode(String.self, forKey: .uid)
        weight = try container.decode(String.self, forKey: .weight)
        weightUnit = try container.decode(String.self, forKey: .weightUnit)
        
        let timestamp = try container.decode(Timestamp.self, forKey: .dateOfBirth)
        dateOfBirth = timestamp.dateValue()
    }
    
    init(firstName: String, lastName: String, email: String, gender: String, height: String, heightUnit: String, weight: String, weightUnit: String, uid: String, dateOfBirth: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.gender = gender
        self.height = height
        self.heightUnit = heightUnit
        self.weight = weight
        self.weightUnit = weightUnit
        self.uid = uid
        self.dateOfBirth = dateOfBirth
    }
    var heightInDouble: Double {
        return Double(height) ?? 0.0
    }
    var weightInDouble: Double {
        return Double(weight) ?? 0.0
    }
}

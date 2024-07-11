//
//  AuthField.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct AuthField: Identifiable {
    let id = UUID()
    var text: Binding<String>
    var placeholder: String
    var imageName: String
    var isSecure: Bool = false
}

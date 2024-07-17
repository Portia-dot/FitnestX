//
//  Extensions.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-09.
//

import SwiftUI

extension Color {
    static let customBlue = Color(hex: "#92A3FD")
    static let customPurple = Color(hex: "#C58BF2")
    static let customDark = Color(hex: "#1D1617")
    static let customGrey = Color(hex: "#7B6F72")
    static let customLightBlue = Color(hex: "#9DCEFF")
    static let customPink = Color(hex: "#EEA4CE")
    static let customWhite = Color(hex: "F6F5F5")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

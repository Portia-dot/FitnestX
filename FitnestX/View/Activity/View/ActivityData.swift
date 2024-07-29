//
//  ActivityData.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-27.
//

import SwiftUI

struct ActivityData {
    var day: String
    var value: CGFloat
    var gradient: Gradient
    
    
    static let monthlyData = [
        ActivityData(day: "01", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "02", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "03", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "04", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "05", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "06", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "07", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "08", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "09", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "10", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "11", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "12", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "13", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "14", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "15", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "16", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "17", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "18", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "19", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "20", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "21", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "22", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "23", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "24", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "25", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "26", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "27", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "28", value: 30, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "29", value: 60, gradient: Gradient(colors: [.blue, .purple])),
        ActivityData(day: "30", value: 90, gradient: Gradient(colors: [.pink, .purple])),
        ActivityData(day: "31", value: 30, gradient: Gradient(colors: [.blue, .purple]))
    ]
    
}

extension Array where Element == ActivityData {
    func weeklyAverage() -> [ActivityData] {
        var weeklyData: [ActivityData] = []
        var weeksum: CGFloat = 0
        var dayCount = 0
        
        for (index, data) in self.enumerated() {
            weeksum += data.value
            dayCount += 1
            
            if dayCount == 7 || index ==  self.count - 1 {
                let average = weeksum / CGFloat(dayCount)
                weeklyData.append(ActivityData(day: "Week \(weeklyData.count + 1)", value: average, gradient:Gradient(colors: [.blue, .purple])))
                weeksum = 0
                dayCount = 0
            }
        }
        
        return weeklyData
    }
}

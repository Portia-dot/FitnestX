//
//  WorkoutViews.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI


struct WorkoutsData {
    var title: String
    var calories: String
    var time: String
    var imageName: String
}


extension WorkoutsData {
    static let sampleData = [
        WorkoutsData(title: "Fullbody Workout", calories: "180 Calories Burn", time: "20 Minutes", imageName: "Workout-Pic"),
        WorkoutsData(title: "Leg Day", calories: "200 Calories Burn", time: "25 Minutes", imageName: "Workout-Pic-1"),
        WorkoutsData(title: "Upper Body", calories: "150 Calories Burn", time: "15 Minutes", imageName: "Workout-Pic-2")
    ]
}



//
//  Task.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-11.
//
//


import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Abs Workout", creationDate: .updateHour(-1), isCompleted: true, tint: Color.customBlue),
    .init(taskTitle: "Shoulder Workout", creationDate: .updateHour(9), tint:  Color.customBlue),
    .init(taskTitle: "Back Workout", creationDate: .updateHour(10), tint: Color.customBlue),
    .init(taskTitle: "Cardio", creationDate: .updateHour(0), tint: Color.customBlue),
    .init(taskTitle: "Legs Workout", creationDate: .updateHour(2), tint: Color.customBlue),
    .init(taskTitle: "Chest Workout", creationDate: .updateHour(12), tint: Color.customBlue),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}

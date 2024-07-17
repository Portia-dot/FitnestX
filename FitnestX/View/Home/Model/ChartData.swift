//
//  ChartData.swift
//  ChartTutorial
//
//  Created by Modamori Oluwayomi on 2024-07-16.
//

import SwiftUI
struct ChartData: Identifiable{
    var id = UUID().uuidString
    var hours: Date
    var bpm: Double
    var animate: Bool = false
}

extension Date{
    func updateHour(value: Int) -> Date  {
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}


var chartData: [ChartData] = [
    ChartData(hours: Date().updateHour(value: 0), bpm: 68),
    ChartData(hours: Date().updateHour(value: 1), bpm: 65),
    ChartData(hours: Date().updateHour(value: 2), bpm: 64),
    ChartData(hours: Date().updateHour(value: 3), bpm: 62),
    ChartData(hours: Date().updateHour(value: 4), bpm: 30),
    ChartData(hours: Date().updateHour(value: 5), bpm: 67),
    ChartData(hours: Date().updateHour(value: 6), bpm: 40),
    ChartData(hours: Date().updateHour(value: 7), bpm: 72),
    ChartData(hours: Date().updateHour(value: 8), bpm: 74),
    ChartData(hours: Date().updateHour(value: 9), bpm: 78),
    ChartData(hours: Date().updateHour(value: 10), bpm: 80),
    ChartData(hours: Date().updateHour(value: 11), bpm: 85),
    ChartData(hours: Date().updateHour(value: 12), bpm: 88),
    ChartData(hours: Date().updateHour(value: 13), bpm: 84),
    ChartData(hours: Date().updateHour(value: 14), bpm: 50),
    ChartData(hours: Date().updateHour(value: 15), bpm: 80),
    ChartData(hours: Date().updateHour(value: 16), bpm: 79),
    ChartData(hours: Date().updateHour(value: 17), bpm: 40),
    ChartData(hours: Date().updateHour(value: 18), bpm: 45),
    ChartData(hours: Date().updateHour(value: 19), bpm: 72),
    ChartData(hours: Date().updateHour(value: 20), bpm: 71),
    ChartData(hours: Date().updateHour(value: 21), bpm: 30),
    ChartData(hours: Date().updateHour(value: 22), bpm: 40),
    ChartData(hours: Date().updateHour(value: 23), bpm: 66)
]

//
//  HeartRateData.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-16.
//

import SwiftUI
import Charts

struct HeartRateData: Identifiable, Equatable {
    var id = UUID()
    var time: String
    var bpm: Double
    
    
    
    
}

let dummyHeartRateData: [HeartRateData] = [
    HeartRateData(time: "8 AM", bpm: 60),
    HeartRateData(time: "9 AM", bpm: 62),
    HeartRateData(time: "10 AM", bpm: 65),
    HeartRateData(time: "11 AM", bpm: 70),
    HeartRateData(time: "12 PM", bpm: 75),
    HeartRateData(time: "1 PM", bpm: 80),
    HeartRateData(time: "2 PM", bpm: 78),
    HeartRateData(time: "3 PM", bpm: 74),
    HeartRateData(time: "4 PM", bpm: 72),
    HeartRateData(time: "5 PM", bpm: 70),
    HeartRateData(time: "6 PM", bpm: 68)
]

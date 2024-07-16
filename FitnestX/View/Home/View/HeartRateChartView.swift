//
//  HealthStatusView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-15.
//

import SwiftUI
import Charts

struct HeartRateChartView: View {
    
    var heartRateData: [HeartRateData]
    
    let linearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.accentColor.opacity(0.4), Color.accentColor.opacity(0)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    @State private var selectedData: HeartRateData?
    @State private var currentLocation: CGPoint = .zero
    
    var body: some View {
        VStack{
            if let selectedData = selectedData{
                
            }
        }
    }
}

#Preview {
    HeartRateChartView(heartRateData: [
        HeartRateData(time: "8 AM", bpm: 10),
        HeartRateData(time: "9 AM", bpm: 62),
        HeartRateData(time: "10 AM", bpm: 23),
        HeartRateData(time: "11 AM", bpm: 70),
        HeartRateData(time: "12 PM", bpm: 75),
        HeartRateData(time: "1 PM", bpm: 50),
        HeartRateData(time: "2 PM", bpm: 78),
        HeartRateData(time: "3 PM", bpm: 64),
        HeartRateData(time: "4 PM", bpm: 42),
        HeartRateData(time: "5 PM", bpm: 70),
        HeartRateData(time: "6 PM", bpm: 48),
        HeartRateData(time: "7 PM", bpm: 74),
        HeartRateData(time: "8 PM", bpm: 72),
        HeartRateData(time: "9 PM", bpm: 50),
        HeartRateData(time: "10 PM", bpm: 68)
    ])
}

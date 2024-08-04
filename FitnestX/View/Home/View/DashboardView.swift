//
//  DashboardView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-17.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        HStack(spacing: 0){
            WaterIntake()
                .frame(maxWidth: .infinity)
            Spacer()
            VStack(spacing: 20){
                SleepView(image: "Sleep-Graph", title: "Sleep", description: "8h 20m")
                    
                SleepView(title: "Heart Beat", description: "120BPM")
                Spacer()
                CalorieTrackerView()
            }
        
            .frame(maxWidth: .infinity, maxHeight: 450)
        }
//        .overlay{
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.customBlue, lineWidth: 4)
//        }
        .padding()
    }
}

#Preview {
    DashboardView()
}

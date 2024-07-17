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
                SleepView()
                Spacer()
                CalorieTrackerView()
            }
            .frame(maxWidth: .infinity, maxHeight: 450)
        }
        .padding()
    }
}

#Preview {
    DashboardView()
}

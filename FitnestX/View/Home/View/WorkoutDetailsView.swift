//
//  WorkoutDetailsView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct WorkoutDetailsView: View {
    //    var workout: WorkoutData?
    
    var body: some View {
        ScrollView {
            VStack {
                ReuseableChart(pastWeekLineBackground: Color.customWhite.opacity(0.7), currentWeekLineColor: Color.customWhite, lineBackground: Color.customBlue, lineGradientColorStart: Color.customWhite.opacity(0.8), lineGradientColorStop: Color.customWhite.opacity(0.2), pastWeekLineWidth: 2, currentWeekLineWidth: 4, chartBackGround: Color.clear)
                    .frame(height: 300)
                Spacer()
                
            }
            
        }
        .background{
            Color.customBlue
            //            .padding(.horizontal)
        }
        .ignoresSafeArea(edges: .top)
    }
}
#Preview {
    WorkoutDetailsView()
}

//
//  WorkoutProgressView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-17.
//

import SwiftUI
import Charts

struct WorkoutProgressView: View {
    @State private var selectedWorkOut: WorkoutData?
    let yValues = stride(from: 0, to: 110, by: 10).map{$0}
    @State private var isActive = false 
    @State private var selection = "Weekly"
    let period = ["Weekly", "Monthly", "Yearly"]
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Workout Progress")
                        .foregroundStyle(.black)
                        .font(.headline)
                    
                    Spacer()
                    CustomPicker()
                }
                .padding(.bottom)
                ReuseableChart(
                    pastWeekLineBackground:Color.customPurple.opacity(0.3),
                    currentWeekLineColor: Color.customBlue.opacity(0.5), lineBackground: Color.customPink,
                    lineGradientColorStart: Color.customBlue.opacity(0.2),
                    lineGradientColorStop: Color.customBlue,
                    pastWeekLineWidth: 2,currentWeekLineWidth: 4,
                    chartBackGround: Color.clear
                )
            }
        }
    }
    
    @ViewBuilder
    private func tooltipView(for data: WorkoutData) -> some View {
        VStack(alignment: .leading, spacing: 6){
            HStack{
                Text("\(data.day) - \(data.name)" )
                    .padding(8)
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .foregroundStyle(.black)
                Text("\(data.currentWeekCompletion)%")
                    .font(.title3.bold())
                    .foregroundStyle(Color.customDark)
            }
            
            ProgressBar(progress: 10 ,progressColor: Color.customBlue)
               .frame(width: 20, height: 6)
                .padding(.top, 4)
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.clear)
                .shadow(radius: 3)
        }
        .background(Color.white)
        .cornerRadius(10, corners: .allCorners)
    }
}

#Preview {
    WorkoutProgressView()
}


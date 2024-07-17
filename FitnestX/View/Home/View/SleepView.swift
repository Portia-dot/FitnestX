//
//  SleepView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-17.
//

import SwiftUI

struct SleepView: View {
    var body: some View {
        VStack(spacing: 40){
            VStack(alignment: .leading, spacing: 10){
                Text("Sleep")
                    .font(.callout)
                    .fontWeight(.bold)
                Text("8h 20m")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.customPurple)
                
                Image("Sleep-Graph")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .fill(Color.white)
//                    .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
//            )
            
        }
    }
}

#Preview {
    CalorieTrackerView()
}

struct CalorieTrackerView: View {
    let totalCalories: Double = 990
    let consumedCalories: Double = 760
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Calories")
                .font(.callout)
                .fontWeight(.bold)
            Text("\(Int(consumedCalories)) kCal")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.customPurple)
            
            //Circular Progress
            ZStack{
                Circle()
                    .stroke(lineWidth: 5)
                    .opacity(0.3)
                    .foregroundStyle(Color.customPurple)
                    .frame(width: 95, height: 70)
                Circle()
                    .trim(from: 0.0, to: CGFloat(consumedCalories / totalCalories))
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(Color.customPurple)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.linear, value: consumedCalories)
                    .frame(width: 95, height: 70)
                
                Circle()
                    .fill(Color.customBlue)
                    .frame(width: 85, height: 63)
    
                
                VStack{
                    Text("\(Int(totalCalories - consumedCalories)) KCal left")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        
                }
                
            }
        }
        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .fill(Color.white)
//                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
//        )
    }
}

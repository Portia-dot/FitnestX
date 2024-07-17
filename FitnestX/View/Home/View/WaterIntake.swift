//
//  WaterIntake.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-16.
//

import SwiftUI

struct WaterIntake: View {
    let totalIntake: Double = 4000
    @State var currentIntake: Double = 2800
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 40){
                GeometryReader{ geometry in
                    VStack{
                        ZStack(alignment: .bottom){
                            Rectangle()
                                .frame(width: 45, height: geometry.size.height)
                                .cornerRadius(20)
                                .foregroundStyle(Color.customBlue.opacity(0.3))
                            
                            Rectangle()
                                .frame(width: 45, height: geometry.size.height * CGFloat(currentIntake / totalIntake))
                                .cornerRadius(20)
                                .foregroundStyle(Color.customBlue)
                            
                        }
                        .padding()
                    }
                }
                .frame(width: 40)
                VStack(alignment: .leading){
                    VStack(spacing: 20){
                        Text("Water Intake")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("\(Int(currentIntake/1000)) Liters")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.customPurple)
                        Text("Real Time Updates")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundStyle(Color.customGrey)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func intakeTimeSlot() -> some View{
        var time: String
        var amount: String
    }
}

#Preview {
    WaterIntake()
}

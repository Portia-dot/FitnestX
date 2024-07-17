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
        HStack{
            VStack{
                HStack(alignment: .top, spacing: 10){
                    GeometryReader{ geometry in
                        VStack{
                            ZStack(alignment: .bottom){
                                Rectangle()
                                    .frame(width: 10, height: geometry.size.height)
                                    .cornerRadius(20)
                                    .foregroundStyle(Color.customGrey.opacity(0.3))
                                
                                Rectangle()
                                    .frame(width: 10, height: geometry.size.height * CGFloat(currentIntake / totalIntake))
                                    .cornerRadius(20)
                                    .foregroundStyle(Color.customBlue)
                                
                            }
                            //                        .padding()
                        }
                    }
                    .frame(width: 20)
                    VStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text("Water Intake")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text("\(Int(currentIntake/1000)) Liters")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.customPurple)
                            Text("Real Time Updates")
                                .font(.footnote)
                                .layoutPriority(1)
                                .fontWeight(.light)
                                .foregroundStyle(Color.customGrey)
                        }
                        IntakeTimeSlot(time: "6am - 8am", amount: "600ml")
                        IntakeTimeSlot(time: "9am - 11am", amount: "600ml")
                        IntakeTimeSlot(time: "11am - 2pm", amount: "600ml")
                        IntakeTimeSlot(time: "2pm - 4pm", amount: "600ml")
                        IntakeTimeSlot(time: "4pm - now", amount: "600ml")
                    }
                }
                .padding()
                .frame(height: 450)
                
            }
//            .background(
//                RoundedRectangle(cornerRadius: 15, style: .continuous)
//                    .fill(Color.white)
//                    .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
//            )
        }
    }
    
    @ViewBuilder
    func IntakeTimeSlot(time: String, amount: String) -> some View{
        HStack(alignment: .top, spacing: 20){
            VStack{
                Image("progressbar")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 6)
                    .frame(width: 10, height: 55)
            }
            VStack(alignment: .leading){
                Text("\(time)")
                    .font(.footnote)
                    .foregroundStyle(Color.customGrey)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)

                
                Text("\(amount)")
                    .font(.callout)
                    .foregroundStyle(Color.customPurple)
                    .bold()
            }
        }
    }
}

#Preview {
    DashboardView()
}

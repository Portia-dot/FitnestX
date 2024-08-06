//
//  upcomingWorkoutCard.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-05.
//

import SwiftUI

struct upcomingWorkoutCard: View {
    var title: String
    var time: String
    var image: String
    @State var isToggle: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 6){
                    Text(title)
                            .font(.footnote)
                            .foregroundStyle(Color.customDark)
                            .bold()
                    HStack(spacing: 6){
                            Text(time)
                        }
                        .font(.footnote)
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundStyle(Color.customGrey)
                }
                Spacer()
                VStack{
                   Toggle("", isOn: $isToggle)
                        .toggleStyle(SwitchToggleStyle(tint: Color.customPurple))
                }

            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.customWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 2)
    }
}

#Preview {
    upcomingWorkoutCard(title: "Fullbody Workout", time: "Today, 03:00pm", image: "Workout-Pic", isToggle: true)
}




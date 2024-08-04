//
//  WorkOut.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-20.
//

import SwiftUI

struct WorkOut: View {
    var title: String
    var calories: String
    var time: String
    var image: String
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
                            Text(calories)
                            Text("|")
                            Text(time)
                        }
                        .font(.footnote)
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundStyle(Color.customGrey)
                    HStack{
                        BarProgessStyle(progress: 0.7, width: 200, height: 10, backgroundColor: Color.white, foregroundColor: Color.customPurple, cornerRadius: 10, roundedCorners: [.topLeft, .bottomLeft])
                    }
                    .padding(.top, 4)
                }
                VStack{
                    Button {
                        
                    } label: {
                       Image("Workout-Btn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }

                }

            }
        }
        .padding()
        .background(Color.customWhite)
        .shadow(radius: 50)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    WorkOut(title: "Fullbody Workout", calories: "180 Calories Burn", time: "20 Minutes", image: "Workout-Pic")
}

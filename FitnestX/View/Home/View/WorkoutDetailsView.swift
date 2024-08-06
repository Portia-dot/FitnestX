//
//  WorkoutDetailsView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ReuseableChart(pastWeekLineBackground: Color.customWhite.opacity(0.7), currentWeekLineColor: Color.customWhite, lineBackground: Color.customBlue, lineGradientColorStart: Color.customWhite.opacity(0.8), lineGradientColorStop: Color.customWhite.opacity(0.2), pastWeekLineWidth: 2, currentWeekLineWidth: 4, chartBackGround: Color.clear, yAxisColor: Color.customGrey.opacity(0.4), yAxisTextColor: Color.customWhite, xAxisTextColor: Color.customWhite)
                
                    .frame(height: 300)
                
                //Reuseable Card
            }
            VStack(spacing: 40){
                ReseableCard(title: "Daily Workout Schedule", buttonText: "Check")
                    .padding(.top, 10)
                
                //Account Card
              upcomingWorkoutView()
                
                
              
                
            }
            .padding()
            .navigationTitle("Workout Tracker")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("Back-Navs")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.customGrey)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image("More Circle")
                            .resizable()
                            .symbolRenderingMode(.hierarchical)
                            .frame(width: 25, height: 25)
                            .background{Color.customWhite}
                            .cornerRadius(10, corners: .allCorners)
                    }
                    
                    
                }
                
            }
        
            .background(Color.customWhite)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            
            
           
            
            
            
        }
        .background(Color.customBlue)
       
        

    }
}
#Preview {
    workoutCards()
}


struct upcomingWorkoutView: View {
    var body: some View {
        VStack(spacing: 20){
            HStack{
            Text("Upcoming Workout")
                    .font(.callout)
                    .bold()
                Spacer()
            Text("See more")
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(Color.customGrey)
                
            }
            .padding()
            upcomingWorkoutCard(title: "Fullbody Workout", time: "Today, 03:00pm", image: "Workout-Pic", isToggle: true)
            upcomingWorkoutCard(title: "Fullbody Workout2", time: "June 04, 03:00pm", image: "Workout-Pic", isToggle: false)
        }
    }
}


struct workoutCards : View {
    var body: some View {
        VStack{
                Text("What Do You Want To Train")
                    .font(.callout)
                    .bold()
            HStack{
                VStack(alignment:.leading, spacing: 15){
                    Text("Fullbody Workout")
                        .bold()
                    Text("11 Exercises | 32mins")
                        .foregroundStyle(Color.customGrey)
                    
                    //Button
                    Button(action: {}, label: {
                        Text("View More")
                            .font(.callout)
                            .bold()
                            .foregroundStyle(Color.customGrey)
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                
                Image("Vector-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 100, height: 100)
                    .background(Color.customGrey.opacity(0.3))
                    .clipShape(Circle())
                    .padding()
            }
            
        }
    }
}

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
                ReuseableChart(pastWeekLineBackground: Color.customBlue.opacity(0.7), currentWeekLineColor: Color.customBlue, lineBackground: Color.customBlue, lineGradientColorStart: Color.customBlue.opacity(0.8), lineGradientColorStop: Color.customBlue.opacity(0.2), pastWeekLineWidth: 2, currentWeekLineWidth: 4, chartBackGround: Color.clear, yAxisColor: Color.customGrey.opacity(0.4), yAxisTextColor: Color.customBlue, xAxisTextColor: Color.customBlue)
                
                    .frame(height: 300)
                
                //Reuseable Card
            }
            VStack(spacing: 40){
                ReseableCard(title: "Daily Workout Schedule", buttonText: "Check")
                    .padding(.top, 10)
                    .padding()
                
                //Account Card
              upcomingWorkoutView()
                    .padding()
                //
                workoutCards()
            }
            .padding(.bottom)
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
        
            .cornerRadius(20, corners: [.topLeft, .topRight])
            
            
           
            
            
            
        }
//        .background(Color.customBlue)
       
        

    }
}
#Preview {
    WorkoutDetailsView()
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
            .padding(.horizontal)
            upcomingWorkoutCard(title: "Fullbody Workout", time: "Today, 03:00pm", image: "Workout-Pic", isToggle: true)
            upcomingWorkoutCard(title: "Fullbody Workout2", time: "June 04, 03:00pm", image: "Workout-Pic", isToggle: false)
        }
    }
}


struct workoutCards : View {
    var body: some View {
        VStack(alignment: .leading){
                Text("What Do You Want To Train")
                    .font(.callout)
                    .bold()
                    .padding(.horizontal)
            ReuseableWorkoutCard(workoutType: "Full Body Workout", exerciseAmount: "11 Exercises", time: "32 Mins", imageName: "Vector-1")
            ReuseableWorkoutCard(workoutType: "LowerBody Workout", exerciseAmount: "12 Exercises", time: "40 Mins", imageName: "Vector-2")
            ReuseableWorkoutCard(workoutType: "ABs Workout", exerciseAmount: "14 Exercises", time: "20 Mins", imageName: "Vector")
        }
    }
}

struct ReuseableWorkoutCard: View {
    var workoutType: String
    var exerciseAmount: String
    var time: String
    var imageName: String
    var body: some View {
        HStack{
            VStack(alignment:.leading, spacing: 10){
                Text(workoutType)
                    .font(.callout)
                    .bold()
                Text("\(exerciseAmount) | \(time)")
                    .foregroundStyle(Color.customGrey)
                    .font(.caption)
                
                //Button
                Button(action: {}, label: {
                    Text("View More")
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(Color.customBlue)
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background{
                    Color.customWhite
                }
                .clipShape(Capsule())
                
            }
            Spacer()
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: 80, height: 80)
                .background(Color.customWhite)
                .clipShape(Circle())
                .padding()
        }
        .padding()
        .background{
            Color.customBlue.opacity(0.2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

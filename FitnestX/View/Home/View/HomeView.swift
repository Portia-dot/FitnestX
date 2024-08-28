//
//  HomeView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: RegistrationAuth
    @State private var showNotificationSheet: Bool = false
    @State private var hasNotifcation: Bool = true
    @State private var showFullWorkout: Bool = false
    @State private var showWorkOutSchedule = false
    let workouts: [WorkoutsData] = WorkoutsData.sampleData
    let user: User
    
    //User
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Welcome Back")
                                .font(.callout)
                                .foregroundStyle(Color.customGrey)
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.title)
                                .foregroundStyle(Color.customDark)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        
                        
                        ZStack{
                            Button {
                                showNotificationSheet = true
                            } label: {
                                Image("Notification")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            
                            if hasNotifcation {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 4, height: 4)
                                    .offset(x: 3, y: -7)
                                
                            }
                        }
                        
                    }
                    .padding()
                    
                    
                    RoundedSectorSpaceView(weight: user.weightInDouble, height: user.heightInDouble, heightUnit: user.heightUnit, weightUnit: user.weightUnit)
                    
                    ReseableCard(title: "Today Target", buttonText: "Check", buttonAction: {
                        showWorkOutSchedule = true
                    })
                        .padding()
    
                    //Chart View
                    ChartHomeView()
                    
                    //Water Intake and sleep
                    DashboardView()
                    
                    WorkoutProgressView()
                        .frame(height: 350)
                        .padding()
                    
                    //Workout
                    VStack{
                      
                        HStack{
                            Text("Latest Workout")
                                .foregroundStyle(Color.customDark)
                                .font(.headline)
                                .bold()
                            Spacer()
                            Button("See more"){
                                withAnimation(.spring()){
                                    showFullWorkout = true
                                }
                                
                            }
                            .font(.footnote)
                            .foregroundStyle(Color.customGrey)
                        }
                        .padding()
    
                        ForEach(workouts.prefix(2), id: \.title){workouts in
                            WorkOut(title: workouts.title, calories: workouts.calories, time: workouts.time, image: workouts.imageName)
                        }
                    }
                    
                }
            }
            .sheet(isPresented: $showFullWorkout) {
                ActivityDetailsView()
            }
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.customWhite)
                    .ignoresSafeArea()
            }
            .navigationDestination(isPresented: $showNotificationSheet) {
                NotificationView()
        }
            .navigationDestination(isPresented: $showWorkOutSchedule) {
                WorkOutScheduleView()
            }
           

        }
    }
    
    @ViewBuilder
    func ActivityDetailsView() -> some View {
        @Environment (\.dismiss) var dismiss
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(workouts, id: \.title){workouts in
                        WorkOut(title: workouts.title, calories: workouts.calories, time: workouts.time, image: workouts.imageName)
                    }
                }
                .padding()
//                .padding(.top, 20)
//                .padding(.horizontal)
                .navigationTitle("All Workouts")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                           //Dismiss Sheet
                            $showFullWorkout.wrappedValue = false
                        }) {
                            Image("Back-Navs")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.customGrey)
                        }
                    }
                }
            }
            .background(Color.white)
        }
        
    }
    
}
#Preview {
        HomeView(user: User(firstName: "John",
                            lastName: "Doe",
                            email: "john.doe@example.com",
                            gender: "Male",
                            height: "180",
                            heightUnit: "cm",
                            weight: "75",
                            weightUnit: "kg",
                            uid: "12345",
                            dateOfBirth: Date()))
        .environmentObject(RegistrationAuth())
}
//}


struct ReseableCard: View {
    var title: String
    var buttonText: String
    var buttonAction: (() -> Void)? = nil
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(Color.customDark)
                    .font(.footnote)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Spacer()
                if let action = buttonAction{
                    Button(action: action, label: {
                        Text(buttonText)
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.customBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                    .padding()
                }
                
            }
            .padding(.horizontal)
            .background(Color.customPurple.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
        }
       
    }
}

//
//  HomeView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: RegistrationAuth
    let user: User
    //User
    var body: some View {
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
                    
                    Image("Notification")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding()
                RoundedSectorSpaceView(weight: user.weightInDouble, height: user.heightInDouble, heightUnit: user.heightUnit, weightUnit: user.weightUnit)
                
                VStack{
                    HStack{
                        Text("Today Target")
                            .foregroundStyle(Color.customDark)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Check")
                                .foregroundStyle(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color.customBlue)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        })
                        .padding()
                    }
                    .padding(.horizontal)
                    .background(Color.customLightBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    
                }
                .padding()
                
                ChartHomeView()
                
              DashboardView()
                Spacer()
                
            }
        }
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.customWhite)
                .ignoresSafeArea()
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

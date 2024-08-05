//
//  Profile.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct Profile: View {
    @State private var isTapped = false
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var auth : RegistrationAuth
    @State private var shouldNavigateToLogin = false
    @State private var showNotification = true
    let user: User
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20){
                //User Card
                userCard()
                HStack(spacing: 15){
                    userDetailsCard(detail: user.height, detailUnit: user.heightUnit, title: "Height")
                    userDetailsCard(detail: user.weight, detailUnit: user.weightUnit, title: "Weight")
                    userDetailsCard(detail: "\(user.age)", detailUnit: "Yo", title: "Age")
                }
                accountCard()
                
                //Notification Toggle View
                notificationView()

                
                othersCard()
                
                Spacer()
                CustomButtonView(isTapped: $isTapped, buttonBackgroundColor: Color.customPurple, buttonTextColor: Color.customGrey, label: "Log Out") {
                    auth.logout()
                    
                }
                
            }
            .padding()
            .navigationTitle("Notification")
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
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.customGrey)
                    }
                    
                }
        }
        }
        
                .onReceive(auth.$userSession) {userSession in
                    if userSession == nil{
                        shouldNavigateToLogin = true
                    }
                }
                .fullScreenCover(isPresented: $shouldNavigateToLogin, content: {
                    LoginView(authMode: .constant(.login))
                        .environmentObject(auth)
                })
    }
    @ViewBuilder
    func userCard() -> some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                ZStack{
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(Color.customBlue.opacity(0.5))
                    Image("userProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                }
                .padding(.trailing, 4)
                // Users Full Name
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.footnote)
                        .foregroundStyle(Color.customDark)
                        .bold()
                    Text("Losing Fat Program")
                        .font(.footnote)
                        .foregroundStyle(Color.customGrey)
                }
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isTapped = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isTapped = false
                        }
                    }
                } label: {
                    Text("Edit")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.customWhite)
                        .frame(width: 100, height: 10)
                        .padding(.vertical, 14)
                        .background(Color.customBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .scaleEffect(isTapped ? 0.95 : 1.0)
                        .opacity(isTapped ? 0.8 : 1.0)
                }
            }
//            .padding(.horizontal, 20)
//            .padding(.vertical, 20)
        }

    }
    
    @ViewBuilder
    func userDetailsCard(detail: String, detailUnit: String, title: String) -> some View {
          VStack(spacing: 10) {
              HStack(alignment: .lastTextBaseline, spacing: 2){
                  Text(detail)
                      .font(.title3)
                      .foregroundStyle(Color.customPurple)
                      .bold()
                  Text(detailUnit.lowercased())
                    .font(.title3)
                    .foregroundStyle(Color.customPurple)
                    .bold()
              }
              Text(title)
                  .font(.footnote)
                  .foregroundStyle(Color.customGrey)
                  .bold()
          }
          .frame(width: 70, height: 60)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.white)
          .cornerRadius(10)
          .shadow(radius: 5)
      }
    //Reuseable
    @ViewBuilder
    func accountCardReuseable(imageName: String, title: String) -> some View{
        HStack{
            Image(systemName: imageName)
                .resizable()
                .frame(width: 20, height: 20)
//                .padding(.horizontal, 10)
                .foregroundStyle(Color.customBlue)
            Text(title)
                .font(.footnote)
                .foregroundStyle(Color.customGrey)
                .bold()
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
    
    @ViewBuilder
    func accountCard() -> some View {
        VStack{
            VStack(alignment: .leading){
                Text("Account")
                    .font(.title3)
                    .foregroundStyle(Color.customDark)
                    .bold()
                    .padding(.bottom, 20)
                
                accountCardReuseable(imageName: "person.crop.circle", title: "Personal Information")
                accountCardReuseable(imageName: "list.bullet.clipboard", title: "Acheivement")
                accountCardReuseable(imageName: "chart.pie", title: "Activity History")
                accountCardReuseable(imageName: "chart.line.uptrend.xyaxis", title: "Workout Progress")
            }
            .padding()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    
    @ViewBuilder
    func notificationView() -> some View{
        VStack{
            VStack(alignment: .leading){
                Text("Notification")
                    .font(.title3)
                    .foregroundStyle(Color.customDark)
                    .bold()
                    .padding(.bottom, 10)
                
                
                HStack{
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.customBlue)
                    Text("Pop-up Notification")
                        .font(.footnote)
                        .foregroundStyle(Color.customGrey)
                        .bold()
                    Spacer()
                    RoundedRectangle(cornerRadius: 16, style: .circular)
                        .fill(showNotification ? Color.customBlue : Color.customWhite)
                        .frame(width: 50, height: 29)
                        .overlay{
                            Circle()
                                .fill(showNotification ? Color.customWhite : Color.customBlue)
                                .shadow(radius: 1, x:0, y:1)
                                .padding(1.5)
                                .offset(x: showNotification ? 10 : -10)
                                .animation(.easeInOut(duration: 1), value: showNotification)
                                .onTapGesture {
                                    showNotification.toggle()
                                }
                        }
            
                    
                    
                }
                
            }
            .padding()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
   //Others
    
    @ViewBuilder
    func othersCard() -> some View {
        VStack{
            VStack(alignment: .leading){
                Text("Others")
                    .font(.title3)
                    .foregroundStyle(Color.customDark)
                    .bold()
                    .padding(.bottom, 20)
                
                accountCardReuseable(imageName: "envelope.open.badge.clock", title: "Contact Us")
                accountCardReuseable(imageName: "shield.lefthalf.filled.badge.checkmark", title: "Privacy Policy")
                accountCardReuseable(imageName: "gear", title: "Setting")
                accountCardReuseable(imageName: "newspaper", title: "Updates")
            }
            .padding()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    Profile(user: User(firstName: "John",
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




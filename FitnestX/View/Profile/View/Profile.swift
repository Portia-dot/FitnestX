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
    let user: User
    var body: some View {
        VStack(spacing: 10){
            //User Card
            userCard()
            HStack(spacing: 10){
                userDetailsCard(detail: user.height, detailUnit: user.heightUnit, title: "Height")
                userDetailsCard(detail: user.weight, detailUnit: user.weightUnit, title: "Weight")
                userDetailsCard(detail: "\(user.age)", detailUnit: "Yo", title: "Age")
            }
            accountCard()
                .padding()
            Spacer()
            CustomButtonView(isTapped: $isTapped, buttonBackgroundColor: Color.customPurple, buttonTextColor: Color.customGrey, label: "Log Out") {
                auth.logout()
                
            }
            
        }
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
        
        //        .onReceive(auth.$userSession) {userSession in
        //            if userSession == nil{
        //                shouldNavigateToLogin = true
        //            }
        //        }
        //        .fullScreenCover(isPresented: $shouldNavigateToLogin, content: {
        //            LoginView(authMode: .constant(.login))
        //                .environmentObject(auth)
        //        })
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
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
        }

    }
    
    @ViewBuilder
    func userDetailsCard(detail: String, detailUnit: String, title: String) -> some View {
          VStack(spacing: 10) {
              Text(detail + detailUnit)
                  .font(.title3)
                  .foregroundStyle(Color.customPurple)
                  .bold()
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
            Spacer()
            Text(title)
                .font(.footnote)
                .foregroundStyle(Color.customBlue)
                .bold()
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func accountCard() -> some View {
        VStack{
            VStack{
                Text("Account")
                    .font(.title3)
                    .foregroundStyle(Color.customDark)
                    .bold()
                
                accountCardReuseable(imageName: "person.crop.circle", title: "Personal Information")
                accountCardReuseable(imageName: "person.crop.circle", title: "Personal Information")
                accountCardReuseable(imageName: "person.crop.circle", title: "Personal Information")
                accountCardReuseable(imageName: "person.crop.circle", title: "Personal Information")
            }
        }
        .padding(.vertical, 10)
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




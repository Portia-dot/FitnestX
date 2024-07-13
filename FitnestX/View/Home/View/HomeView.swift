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
        .padding(18)
        Spacer()
    }
}
//
//#Preview {
//    HomeView()
//}

//
//  HomeView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var auth: RegistrationAuth
    //User
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Welcome Back")
                    .font(.callout)
                    .foregroundStyle(Color.customGrey)
                if let user = auth.currentUser {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title)
                        .foregroundStyle(Color.customDark)
                        .fontWeight(.bold)
                }else{
                    Text("Loading")
                }
            }
            Spacer()
            
            Image("Notification")
                .resizable()
                .frame(width: 20, height: 20)
        }
        .onAppear{
            auth.fetchUser()
        }
        .padding(18)
        Spacer()
    }
}
//
//#Preview {
//    HomeView()
//}

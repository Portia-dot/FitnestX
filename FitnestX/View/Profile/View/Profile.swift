//
//  Profile.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct Profile: View {
    @State private var isTapped = false
    @EnvironmentObject var auth : RegistrationAuth
    @State private var shouldNavigateToLogin = false
    var body: some View {
        VStack{
            CustomButtonView(isTapped: $isTapped, buttonBackgroundColor: Color.customPurple, buttonTextColor: Color.customGrey, label: "Log Out") {
                auth.logout()
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
}

#Preview {
    Profile()
        .environmentObject(RegistrationAuth())
}

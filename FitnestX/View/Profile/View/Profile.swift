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
    var body: some View {
        VStack{
            CustomButtonView(isTapped: $isTapped, buttonBackgroundColor: Color.customPurple, buttonTextColor: Color.customGrey, label: "Log Out") {
                auth.logout()
            }
        }
    }
}

#Preview {
    Profile()
        .environmentObject(RegistrationAuth())
}

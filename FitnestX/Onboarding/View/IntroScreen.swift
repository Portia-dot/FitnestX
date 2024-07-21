//
//  IntroScreen.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-09.
//

import SwiftUI

struct IntroScreen: View {
    @State private var isTapped: Bool = false
    @State private var buttonBackgroundColor: Color = .white
    @State private var buttonTextColor: Color = .customBlue
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @State private var showOnboarding = false
    @State private var showMainView = false
    
    @EnvironmentObject var auth: RegistrationAuth
    
    var body: some View {
        VStack(spacing: 10, content: {
            Spacer()
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 50)
            
            Text("Everyone Can Train")
                .font(.callout)
                .bold()
                .padding()
            Spacer()
            CustomButtonView(isTapped: $isTapped, buttonBackgroundColor: buttonBackgroundColor, buttonTextColor: buttonTextColor, label: "Get Started") {
                if isFirstTime {
                    showOnboarding = true
                }else{
                    showMainView = true
                }
                isFirstTime = false
            }
        })
        .background(buttonBackgroundColor == .customBlue ? Color.white : Color.customBlue)
        .ignoresSafeArea(.all)
        .onAppear{
            if Bool.random(){
                buttonBackgroundColor = .customBlue
                buttonTextColor = .white
            }else {
                buttonBackgroundColor = .white
                buttonTextColor = .customBlue
            }
        }
        .navigationDestination(isPresented: $showOnboarding) {
            OnboardingPage()
                .environmentObject(auth)
        }
        .navigationDestination(isPresented: $showMainView) {
            MainViewAuth()
                .environmentObject(auth)
        }
    }
}

#Preview {
    IntroScreen()
        .environmentObject(RegistrationAuth())
}

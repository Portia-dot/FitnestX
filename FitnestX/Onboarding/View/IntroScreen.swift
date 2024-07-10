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
            Button{
                withAnimation(.easeInOut(duration: 0.2)){
                    isTapped = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    withAnimation(.easeInOut(duration: 0.2)){
                        isTapped = false
                    }
                    if isFirstTime {
                        showOnboarding = true
                    }else{
                        showMainView = true
                    }
                    isFirstTime = false
                }
            }label: {
                Text("Get Started")
                    .fontWeight(.bold)
                    .foregroundStyle(buttonTextColor)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(buttonBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .scaleEffect(isTapped ? 0.95 : 1.0)
                    .opacity(isTapped ? 0.8 : 1.0)
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            
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
        }
        .navigationDestination(isPresented: $showMainView) {
            MainView()
        }
    }
}

#Preview {
    IntroScreen()
}

//
//  OnboardingPage.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-09.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var currentStep = 0
    @State private var progress: Double = 0.0
    @State private var showMainView = false
    
    let onboardingSteps = [
           OnboardingStep(imageName: "OnboardingImage1", title: "Track Your Goal", description: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"),
           OnboardingStep(imageName: "OnboardingImage2", title: "Get Burn", description: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"),
           OnboardingStep(imageName: "OnboardingImage3", title: "Eat Well", description: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"),
           OnboardingStep(imageName: "OnboardingImage4", title: "Improve Sleep Quality", description: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning")
       ]
    
    struct OnboardingStep {
        let imageName: String
        let title: String
        let description: String
    }

    
    var body: some View {
        NavigationStack{
            VStack{
                currentPageView
                
                HStack{
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)){
                            //Progress Circle Logic
                            
                            if currentStep < onboardingSteps.count - 1 {
                                currentStep += 1
                                progress = Double(currentStep + 1) / Double(onboardingSteps.count)
                            }else {
                               showMainView = true
                            }
                        }
                    } label: {
                        ZStack{
                            Circle()
                                .stroke(Color.customBlue.opacity(0.3), lineWidth: 4)
                                .frame(width: 60, height: 60)
                            
                            Circle()
                                .trim(from: 0.0, to: progress)
                                .stroke(Color.customBlue, lineWidth: 4)
                                .frame(width: 60, height: 60)
                                .rotationEffect(.degrees(-90))
                            
                            Image(systemName: "arrow.right")
                                .foregroundStyle(Color.customBlue)
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.trailing, 20)
                }
            }
            .ignoresSafeArea(.all)
            .navigationDestination(isPresented: $showMainView) {
                MainViewAuth()
            }
        }
    }
    // View Logic

    @ViewBuilder
    private var currentPageView: some View {
        if currentStep < onboardingSteps.count {
            let step = onboardingSteps[currentStep]
            VStack{
                Image(step.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                Spacer()
                Text(step.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                Text(step.description)
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    .padding(.bottom, 60)
                Spacer()
            }
        }
    }
}



extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
}

#Preview {
    OnboardingPage()
}

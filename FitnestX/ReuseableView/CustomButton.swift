//
//  ReuseableView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct CustomButtonView: View {
    @Binding var isTapped: Bool
        var buttonBackgroundColor: Color
        var buttonTextColor: Color
        var label: String
        var action: () -> Void
        
        var body: some View {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isTapped = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isTapped = false
                    }
                    action()
                }
            } label: {
                Text(label)
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
        }
}

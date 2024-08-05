//
//  ProgressBar.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-18.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double
    var progressColor: Color
    var body: some View {
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(width: 100, height: 10)
                    .opacity(0.3)
                    .foregroundStyle(progressColor)
                Rectangle()
                    .frame(width: min(CGFloat(self.progress) * 100, 100), height: 10)
                    .foregroundStyle(Color.customDark)
                    .animation(.linear, value: progress)
            }
            .cornerRadius(4)
    }
}

#Preview {
    ProgressBar(progress: 90/100, progressColor: Color.customBlue )
}

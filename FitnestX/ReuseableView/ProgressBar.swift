//
//  ProgressBar.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-18.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(width: 100, height: 10)
                    .opacity(0.3)
                    .foregroundStyle(Color.customPurple)
                Rectangle()
                    .frame(width: min(CGFloat(self.progress) * 100, geometry.size.width), height: 10)
                    .foregroundStyle(Color.customDark)
                    .animation(.linear)
            }
            .cornerRadius(4)
        }
        .padding()
    }
}

#Preview {
    ProgressBar(progress: 0.5)
}

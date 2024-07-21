//
//  BarProgessStyle.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-21.
//

import SwiftUI

struct BarProgessStyle: View {
    var progress: CGFloat
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    var roundedCorners: UIRectCorner = .allCorners
    var body: some View {
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius : cornerRadius)
                .fill(backgroundColor)
                .frame(width: width, height: height)
                .clipShape(RoundedCorner(radius: cornerRadius, corners: roundedCorners))
            Rectangle()
                .fill(foregroundColor)
                .frame(width: width * progress, height: height)
                .clipShape(RoundedCorner(radius: cornerRadius, corners: roundedCorners))
        }
        
    }
}

#Preview {
    BarProgessStyle(progress: 0.7, width: 200, height: 12, backgroundColor: Color.customBlue, foregroundColor: Color.customPurple, cornerRadius: 10, roundedCorners: [.topLeft, .bottomLeft])
}

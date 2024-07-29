//
//  ActivityBar.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-27.
//

import SwiftUI

struct ActivityBar: View {
    var data: ActivityData
    var maxValue: CGFloat
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.customGrey.opacity(0.2))
                    .frame(height: 200)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.customDark.opacity(0.5))
                    }
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(gradient: data.gradient, startPoint: .bottom, endPoint: .top))
                    .frame(height: data.value / maxValue * 200)
                
            }
            Text(data.day)
                .font(.footnote)
                .foregroundStyle(Color.customGrey)
                
        }
    }
}

struct ActivityBar_Previews: PreviewProvider {
    static var previews: some View {
        ActivityBar(
            data: ActivityData(day: "Mon", value: 50, gradient: Gradient(colors: [.pink, .purple])),
            maxValue: 100
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

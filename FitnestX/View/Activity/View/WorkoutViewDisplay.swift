//
//  Workout .swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-05.
//

import SwiftUI

struct WorkoutViewDisplay: View {
    @State private var dragAmount: CGSize = .zero
    @State private var lastDragOffset: CGSize = .zero
    @State private var currentHeight: CGFloat = 300
    @State private var lastDragValue: CGFloat = 0
    let maxHeight: CGFloat = 350
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .bottom){
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.customBlue, Color.customBlue]), startPoint: .top, endPoint: .trailing))
                    .frame(width: geometry.size.width, height: currentHeight)
                    .animation(.spring(), value: currentHeight)

                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(width: geometry.size.width, height: currentHeight)
                    .animation(.spring(), value: currentHeight)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                let dragChange = value.translation.height - lastDragValue
                                let newHeight = currentHeight + dragChange
                                if  newHeight >= 0 && newHeight <=  maxHeight{
                                    currentHeight = newHeight
                                }
                                lastDragValue = value.translation.height
                            }
                            .onEnded { value in
                                lastDragValue = 0
                                if currentHeight > maxHeight {
                                    currentHeight = maxHeight
                                }else if currentHeight < 0{
                                    currentHeight = 0
                                }
                            }
                    )
                
            }
        }
//        .ignoresSafeArea()
    }
}

#Preview {
    WorkoutViewDisplay()
}

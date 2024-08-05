//
//  WorkoutDetailsView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                ReuseableChart(pastWeekLineBackground: Color.customWhite.opacity(0.7), currentWeekLineColor: Color.customWhite, lineBackground: Color.customBlue, lineGradientColorStart: Color.customWhite.opacity(0.8), lineGradientColorStop: Color.customWhite.opacity(0.2), pastWeekLineWidth: 2, currentWeekLineWidth: 4, chartBackGround: Color.clear)
                    .frame(height: 300)
                
            }
            .padding()
            .navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("Back-Navs")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.customGrey)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image("More Circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.customGrey)
                    }
                    
                }
        }
            
        }
        .background{
            Color.customBlue.ignoresSafeArea()
        }
        
    }
}
#Preview {
    WorkoutDetailsView()
}

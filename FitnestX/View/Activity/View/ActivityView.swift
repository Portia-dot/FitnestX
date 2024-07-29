//
//  Activity.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct ActivityView: View {
    @Environment (\.dismiss) var dismiss
    let horizontalPadding: CGFloat = 20
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                targetView()
                ActivityProgressView()
                   .frame(width: UIScreen.main.bounds.width - 2 * horizontalPadding, height: 350)
                Text("Hello")
            }
            .padding(.horizontal, horizontalPadding)
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
    }
    @ViewBuilder
    func targetReuseable(imageName: String, title: String, objective: String) -> some View {
        HStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading){
                Text(objective)
                    .font(.footnote)
                    .foregroundStyle(Color.customPurple)
                    .bold()
                Text(title)
                    .font(.footnote)
                    .foregroundStyle(Color.customGrey)
                    .bold()
            }
            
        }
        .padding()
        .background(Color.customWhite.opacity(0.9))
        .cornerRadius(10, corners: .allCorners)
    }
    
    @ViewBuilder
    func targetView() -> some View {
        VStack{
            HStack{
                Text("Today Target")
                    .font(.title3)
                    .foregroundStyle(Color.customDark)
                    .bold()
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.customBlue)
                        .frame(width: 35, height: 35)
                    Image(systemName: "plus")
                        .font(.title3)
                        .foregroundStyle(Color.customWhite)
                        .bold()
                    
                }
                .padding(.leading, 10)
            }
//            .padding()
            HStack(spacing: 10){
                targetReuseable(imageName: "Layer", title: "Water Intake", objective: "8L")
                
                targetReuseable(imageName: "boots", title: "Foot Steps", objective: "2400")
            }
    
        }
        .padding()
        .background(Color.customBlue.opacity(0.3))
        .cornerRadius(15, corners: .allCorners)

    }
}

#Preview {
    ActivityView()
}

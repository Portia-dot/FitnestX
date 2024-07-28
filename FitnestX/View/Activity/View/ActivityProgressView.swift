//
//  ActivityProgressView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-27.
//

import SwiftUI

struct ActivityProgressView: View {
    @State private var selectedPeriod: String = "Weekly"
    let data: [ActivityData]
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Activity Progress")
                    .font(.title2)
                    .bold()
                Spacer()
                Menu{
                    Button("Weekly", action: {selectedPeriod = "Weekly"})
                    Button("Monthly", action: {selectedPeriod = "Monthly"})
                }label: {
                    HStack{
                        Text(selectedPeriod)
                        Image(systemName: "chevron.down")
                    }
                    .foregroundStyle(Color.customWhite)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(Color.customBlue)
                    .cornerRadius(15, corners: .allCorners)
                    
                }
            }
            .padding()
            
            HStack(alignment: .bottom, spacing: 15, content: {
                ForEach(data, id: \.day){item in
                    ActivityBar(data: item, maxValue: data.map{$0.value}.max() ?? 1)
                }
            })
            .padding()
            .background(Color.customWhite.opacity(0.2))
            .cornerRadius(20, corners: .allCorners)
            .shadow(radius: 10)
            .padding()

        }
    }
}

struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let data = [
            ActivityData(day: "Sun", value: 30, gradient: Gradient(colors: [.blue, .purple])),
            ActivityData(day: "Mon", value: 80, gradient: Gradient(colors: [.pink, .purple])),
            ActivityData(day: "Tue", value: 60, gradient: Gradient(colors: [.blue, .purple])),
            ActivityData(day: "Wed", value: 100, gradient: Gradient(colors: [.pink, .purple])),
            ActivityData(day: "Thu", value: 90, gradient: Gradient(colors: [.blue, .purple])),
            ActivityData(day: "Fri", value: 50, gradient: Gradient(colors: [.pink, .purple])),
            ActivityData(day: "Sat", value: 70, gradient: Gradient(colors: [.blue, .purple]))
        ]
        
        ActivityProgressView(data: data)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

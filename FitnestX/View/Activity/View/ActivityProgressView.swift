//
//  ActivityProgressView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-27.
//

import SwiftUI

struct ActivityProgressView: View {
    @State private var selectedPeriod: String = "Weekly"
    @State private var data: [ActivityData] = []
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            if selectedPeriod == "Weekly" {
                weeklyView
            }else {
                monthlyView
            }
        }
        .onAppear{
            data = ActivityData.monthlyData
        }
    }
    
    private var headerView: some View {
        HStack{
            Text("Activity Progress")
                .font(.title2)
                .bold()
            Spacer()
            periodSelector
        }
        .padding()
    }
    private var periodSelector: some View {
        Menu{
            Button("Weekly", action: {
                withAnimation{
                    selectedPeriod = "Weekly"
                    data = ActivityData.monthlyData
                }
            })
            Button("Monthly", action: {
                withAnimation{
                    selectedPeriod = "Monthly"
                    data = ActivityData.monthlyData.weeklyAverage()
                }
                
            })
        }label: {
            HStack{
                Text(selectedPeriod)
                Image(systemName: "chevron.down")
            }
            .foregroundStyle(Color.customWhite)
            .padding(.horizontal)
            .padding(.vertical, 13)
            .background(Color.customBlue)
            .cornerRadius(15, corners: .allCorners)
            
        }
    }
    private var weeklyView: some View {
        TabView{
            ForEach(0..<numberOfWeek(), id: \.self){week in
                weekDataView(for: week)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    private func numberOfWeek() -> Int {
        (data.count + 6) / 7
    }
    
    private func weekDataView(for week: Int) -> some View {
        let startIndex = week * 7
        let endIndex = min((week + 1) * 7, data.count)
        let weekData = Array(data[startIndex..<endIndex])
        
        return barChartView(for: weekData)
    }
    
    private var monthlyView: some View {
        barChartView(for: data)
    }
    
    private func barChartView(for items: [ActivityData]) -> some View {
            HStack(alignment: .bottom, spacing: 15) {
                ForEach(items, id: \.day) { item in
                    ActivityBar(data: item, maxValue: data.map { $0.value }.max() ?? 1)
                }
            }
            .padding()
            .background(Color.customWhite.opacity(0.5))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
}

struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        
        ActivityProgressView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

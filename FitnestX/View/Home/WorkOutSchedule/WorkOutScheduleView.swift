//
//  WorkOutScheduleView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-11.
//

import SwiftUI

struct WorkOutScheduleView: View {
    
    @State private var currentDate: Date = .init()
    @State private var weekSlide: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @Namespace private var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
           HeaderView()
        }
        .vSpacing(.top)
        .onAppear{
            if weekSlide.isEmpty{
                let currentWeek = Date().fetchWeek()
                weekSlide.append(currentWeek)
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6, content: {
            HStack (spacing: 10){
                Button(action: {
                    withAnimation(.snappy){
                        if currentWeekIndex > 0 {
                            currentWeekIndex -= 1
                            print("Moved to previous week, currentWeekIndex: \(currentWeekIndex)")
                        }else {
                            let previousWeekStart = weekSlide.first?.first?.date.addingTimeInterval(-7 * 24 * 60 * 60) ?? currentDate
                            let previousWeek = previousWeekStart.fetchWeek()
                            weekSlide.insert(previousWeek, at: 0)
                            currentWeekIndex = 0
                            print("Inserted previous week, currentWeekIndex: \(currentWeekIndex)")
                        }
                        currentDate = weekSlide[currentWeekIndex].first?.date ?? Date()
                        print("Current Date: \(currentDate)")
                    }
                }){
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.customGrey)
                }
                Spacer()
                HStack(spacing: 5){
                    Text(currentDate.format("MMMM"))
                        .foregroundStyle(Color.customGrey)
                    
                    Text(currentDate.format("YYYY"))
                        .foregroundStyle(Color.customGrey)
                }
                .font(.title3.bold())
                Spacer()
                Button(action: {
                    withAnimation(.snappy){
                        if currentWeekIndex < weekSlide.count - 1 {
                            currentWeekIndex += 1
                        }else{
                            let nextWeek = currentDate.addingTimeInterval(7 * 24 * 60 * 60).fetchWeek()
                            weekSlide.append(nextWeek)
                            currentWeekIndex += 1
                        }
                        currentDate = weekSlide[currentWeekIndex].first?.date ?? Date()
                    }
                }){
                    Image(systemName: "arrow.forward.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.customGrey)
                }
            }
            TabView(selection: $currentWeekIndex){
                ForEach(weekSlide.indices, id: \.self){ index in
                let week = weekSlide[index]
                    weekView(week)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
                
        })
        .padding()
        .background(Color.customWhite)
        
    }
    
    @ViewBuilder
    func weekView(_ week: [Date.WeekDay]) -> some View{
        HStack(spacing: 5){
            ForEach(week){ day in
                VStack(spacing: 8){
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? Color.customBlue : Color.customGrey)
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .textScale(.secondary)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? Color.customBlue : Color.customGrey)
                        .frame(width: 35, height: 35)
                }
                .hSpacing(.center)
                .background(.white.shadow(.drop(radius: 1)), in: .rect(cornerRadius: 10))
                .overlay{
                    if isSameDate(day.date, currentDate){
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.customBlue, lineWidth: 3)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }else {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.customGrey, lineWidth: 2)
                    }
                    

                }
                .onTapGesture {
                    withAnimation(.snappy){
                        currentDate = day.date
                    }
                }
            }
        }
    }
}

#Preview {
    WorkOutScheduleView()
}

//
//  WorkOutScheduleView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-11.
//

import SwiftUI

struct WorkOutScheduleView: View {
    
    @EnvironmentObject var auth: RegistrationAuth
    @State private var tasks: [Task] = []
    @State private var currentDate: Date = .init()
    @State private var weekSlide: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @Namespace private var animation
    @State private var createNewTask: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HeaderView()
            ScrollView(.vertical){
                VStack{
                    TaskView()
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
        }
        .navigationBarBackButtonHidden()
        .background{
            Color.customWhite
                .ignoresSafeArea()
        }
        .vSpacing(.top)
        .overlay(alignment: .bottomTrailing){
            Button {
                createNewTask.toggle()
            } label: {
                Image(systemName: "plus")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.customWhite)
                    .frame(width: 55, height: 55)
                    .background(Color.customPurple, in: .circle)
            }
            .padding(15)
            
        }
        .onAppear{
            if weekSlide.isEmpty{
                let currentWeek = Date().fetchWeek()
                weekSlide.append(currentWeek)
            }
            fetchTask()
            
        }
        .sheet(isPresented: $createNewTask) {
            NewTaskView(onTaskAdded: fetchTask)
                .environmentObject(RegistrationAuth.shared)
                .presentationDetents([.height(300)])
                .interactiveDismissDisabled()
                .presentationCornerRadius(30)
                .presentationBackground(Color.customWhite)
        }
        .onChange(of: currentDate) {
            fetchTask()
        }
    }
    
     func fetchTask() {
        let calendar = Calendar.current
        let currentDateOnly = calendar.startOfDay(for: currentDate)
        
        auth.fetchTasks { result in
            switch result {
            case .success(let fetchedTasks):
                let filteredTasks = fetchedTasks.filter { task in
                    calendar.isDate(task.creationDate, inSameDayAs: currentDateOnly)
                }
                print("Fetched tasks successfully. Matching Count: \(filteredTasks.count)")
                self.tasks = filteredTasks
            case .failure(let error):
                print("Failed to fetch tasks \(error.localizedDescription)")
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
                            
                        }else {
                            let previousWeek = Date().fetchWeek(for: .previous, from: weekSlide.first?.first?.date ?? currentDate)
                            weekSlide.insert(previousWeek, at: 0)
                            
                        }
                        currentDate = weekSlide[currentWeekIndex].first?.date ?? Date()
                        
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
                            let nextWeek =  Date().fetchWeek(for: .next, from: weekSlide.last?.last?.date ?? currentDate)
                            weekSlide.append(nextWeek)
                            DispatchQueue.main.async{
                                currentWeekIndex = weekSlide.count - 1
                            }
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
                        fetchTask()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func TaskView() -> some View {
        VStack(alignment: .leading, spacing: 35){
            ForEach($tasks) { $task in
                TaskRowView(task: $task)
                    .background(alignment: .leading){
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
    }
}

#Preview {
    WorkOutScheduleView()
        .environmentObject(RegistrationAuth.shared)
}

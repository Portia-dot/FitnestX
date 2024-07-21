//
//  WorkoutProgressView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-17.
//

import SwiftUI
import Charts

struct WorkoutProgressView: View {
    @State private var selectedWorkOut: WorkoutData?
    var body: some View {
        VStack(alignment: .leading){
            Text("Workout Progress")
                .foregroundStyle(.black)
                .font(.headline)
            Chart{
                ForEach(workoutData){ data in
                    LineMark(x: .value("Day", data.day), y: .value("Completion", data.completion))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Color.customPurple)
                    AreaMark(
                        x: .value("Day", data.day),
                        y: .value("Completion", data.completion)
                    )
                    .foregroundStyle(Color.customPurple.opacity(0.1))
                    .interpolationMethod(.catmullRom)
                    //                    if data ==  selectedWorkOut{
                    //                        BarMark(x: .value("Day", data.day),
                    //                                y: .value("Completion", data.completion))
                    //                        .interpolationMethod(.catmullRom)
                    //                    }
                }
                if let activeItem = selectedWorkOut{
                    BarMark(x: .value("Day", activeItem.day), yStart: .value("Completion", 0), yEnd: .value("Completion", activeItem.completion))
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(stops: [
                                Gradient.Stop(color: Color.customPurple.opacity(0.6), location: 0),
                                Gradient.Stop(color: Color.customPurple.opacity(0.0), location: 1)
                            ]),
                                           startPoint: .bottom,
                                           endPoint: .top
                            )
                        )
                        .cornerRadius(10)
                }
                    
            }
            .background {
                Color.customPurple.opacity(0.1)
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            .chartYScale(domain: 0...100)
            .chartOverlay{ proxy in
                GeometryReader { innerProxy in
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged{value in
                                    let location = value.location
                                    if let day: String = proxy.value(atX: location.x){
                                        if let currentItem = workoutData.first(where: {$0.day == day}){
                                            self.selectedWorkOut = currentItem
                                        }
                                    }
                                }
                                .onEnded{_ in
                                    self.selectedWorkOut = nil
                                }
                        )
                }
            }
        }
        .padding()
        .overlay(alignment: .top){
            if let selectedWorkOut = selectedWorkOut {
                tooltipView(for: selectedWorkOut)
                    .offset(/*@START_MENU_TOKEN@*/CGSize(width: 10.0, height: 10.0)/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    @ViewBuilder
    private func tooltipView(for data: WorkoutData) -> some View {
        VStack(alignment: .leading, spacing: 6){
            HStack{
                Text("\(data.day) - \(data.name)" )
                    .padding(8)
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .foregroundStyle(.black)
                Text("\(data.completion)%")
                    .font(.title3.bold())
                    .foregroundStyle(Color.customDark)
            }
            
            ProgressBar(progress: Double(data.completion) / 100)
               .frame(width: 20, height: 6)
                .padding(.top, 4)
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.clear)
                .shadow(radius: 3)
        }
        .background(Color.white)
        .cornerRadius(10, corners: .allCorners)
    }
}

#Preview {
    WorkoutProgressView()
}


struct WorkoutData: Identifiable, Equatable {
    let id = UUID()
    let day: String
    let completion: Int
    let name: String
    
    static func == (lhs: WorkoutData, rhs: WorkoutData) -> Bool {
        lhs.id == rhs.id
    }
}


let workoutData = [
    WorkoutData(day: "Sun", completion: 50, name: "Cardio"),
    WorkoutData(day: "Mon", completion: 20, name: "Legs"),
    WorkoutData(day: "Tue", completion: 70, name: "Rest"),
    WorkoutData(day: "Wed", completion: 50, name: "Abs"),
    WorkoutData(day: "Thu", completion: 20, name: "Chest"),
    WorkoutData(day: "Fri", completion: 90, name: "Shoulder"),
    WorkoutData(day: "Sat", completion: 90, name: "Cardio")
    
]

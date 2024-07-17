//
//  HomeView.swift
//  ChartTutorial
//
//  Created by Modamori Oluwayomi on 2024-07-16.
//

import SwiftUI
import Charts

struct ChartHomeView: View {
    @Environment (\.colorScheme) var scheme
    @State var sampleAnalytics: [ChartData] = chartData
    @State var currentTab: String = "24 Hours"
    
    @State var currentActiveItem: ChartData?
    @State var plotWidth: CGFloat =  0
    @State var isLineGraph: Bool = true
    
    
    var body: some View {
            VStack{
                VStack(alignment: .leading, spacing: 12, content: {
                                        HStack{
                                            Text("BMP")
                                                .fontWeight(.semibold)
                                            if let activeItem = currentActiveItem{
                                                Text("\(activeItem.bpm, specifier: "%.1f") BPM")
                                            }
                    
                                            Picker("", selection: $currentTab){
                                                Text("7 Days")
                                                    .tag("7 Days")
                                                Text("Week")
                                                    .tag("Week")
                                                Text("Month")
                                                    .tag("Month")
                                            }
                                            .pickerStyle(.segmented)
                                            .padding(.leading, 80)
                                        }
                    AnimatedChart()
                })
                .padding()
                .background {
                    Color.customPurple.opacity(0.1)
                }
                .cornerRadius(15, corners: .allCorners)
//                Toggle("Chart Display", isOn: $isLineGraph)
//                    .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            
        }
    
    
    @ViewBuilder
    func AnimatedChart() -> some View {
        let max = chartData.max { item1, item2 in
            return item2.bpm > item1.bpm
        }?.bpm ?? 0
        
        Chart {
            ForEach(chartData) { item in
                if isLineGraph {
                    LineMark(
                        x: .value("Hour", item.hours, unit: .hour),
                        y: .value("BPM", item.bpm)
                    )
                    .foregroundStyle(Color.customPurple.gradient)
                    .interpolationMethod(.catmullRom)
                    
                    AreaMark(
                        x: .value("Hour", item.hours, unit: .hour),
                        y: .value("BPM", item.bpm)
                    )
                    .foregroundStyle(Color.customPurple.opacity(0.1))
                    .interpolationMethod(.catmullRom)
                } else {
                    BarMark(
                        x: .value("Hour", item.hours, unit: .hour),
                        y: .value("BPM", item.bpm)
                    )
                    .foregroundStyle(Color.blue.gradient)
                }
            }
            if let activeItem = currentActiveItem {
                RuleMark(x: .value("Hour", activeItem.hours))
                    .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                    .annotation(position: .top) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("BPM")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            Text("\(activeItem.bpm, specifier: "%.1f")")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.customPurple)
                                .shadow(radius: 2)
                        }
                    }
            }
        }
        .chartYScale(domain: 0 ... (max + 20))
        .chartOverlay { proxy in
            GeometryReader{innerProxy in
            Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                    .gesture(
                    DragGesture()
                        .onChanged{value in
                            let location = value.location
                            if let date: Date = proxy.value(atX: location.x){
                                let calendar = Calendar.current
                                let hours = calendar.component(.hour, from: date)
                                if let currentItem = sampleAnalytics.first(where: {item in
                                    calendar.component(.hour, from: item.hours)  == hours
                                }){
                                    self.currentActiveItem = currentItem
                                    self.plotWidth = proxy.plotSize.width
                                }
                            }
                        }
                        .onEnded{value in
                            self.currentActiveItem = nil
                        }
                    )
            }
        }
        .frame(height: 250)
        .onAppear{
            animatedGraph()
        }
        
    }
    

    
    //MARK: Animated Graph
    func animatedGraph(fromChange: Bool = false){
        for (index,_) in chartData.enumerated(){
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)){
                withAnimation(fromChange ? .easeInOut(duration: 0.6) : .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)){
                    chartData[index].animate =  true
                }
            }
        }
    }
}

#Preview {
    ChartHomeView()
}

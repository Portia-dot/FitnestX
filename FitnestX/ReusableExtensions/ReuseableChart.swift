import SwiftUI
import Charts

struct ReuseableChart: View {
    @Environment(\.viewContext) var viewContext
    var pastWeekLineBackground: Color
    var currentWeekLineColor: Color
    var lineBackground: Color
    var lineGradientColorStart: Color
    var lineGradientColorStop: Color
    var pastWeekLineWidth: CGFloat
    var currentWeekLineWidth: CGFloat
    var chartBackGround: Color

    @State private var selectedWorkOut: WorkoutData?
    let yValues = stride(from: 0, to: 110, by: 20).map { $0 }
    @State private var isActive = false

    var body: some View {
        Chart {
            
            ForEach(workoutData, id: \.day) { workout in
                LineMark(
                    x: PlottableValue.value("Last week", workout.day),
                    y: PlottableValue.value("Completion Rate", workout.lastWeekCompletion),
                    series: .value("Week", "One")
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(pastWeekLineBackground)
                .lineStyle(StrokeStyle(lineWidth: pastWeekLineWidth))
            }
            
            ForEach(workoutData, id: \.id) { workout in
                LineMark(
                    x: PlottableValue.value("This Week", workout.day),
                    y: PlottableValue.value("Completion Rate", workout.currentWeekCompletion)
                    ,
                    series: .value("Week", "Two")
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(currentWeekLineColor)
                .lineStyle(StrokeStyle(lineWidth: currentWeekLineWidth))
            }
            

            
            
            if let activeItem = selectedWorkOut {
                BarMark(
                    x: .value("Day", activeItem.day),
                    yStart: .value("Completion", 0),
                    yEnd: .value("Completion", activeItem.currentWeekCompletion)
                )
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: lineGradientColorStart, location: 0),
                        Gradient.Stop(color: lineGradientColorStop, location: 1)
                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                ))
                .cornerRadius(10)
            }
        }
        .padding(.vertical)
        .background {
            chartBackGround
        }
        .frame(maxWidth: .infinity, maxHeight: 400)
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                AxisGridLine().foregroundStyle(.clear)
                AxisTick().foregroundStyle(.clear)
                AxisValueLabel().foregroundStyle(Color.white)
            }
        }
        .chartYAxis {
            AxisMarks(position: .trailing, values: yValues){ value in
                AxisGridLine().foregroundStyle(Color.customDark.opacity(0.2))
                AxisValueLabel().foregroundStyle(Color.white)
            }
            
        }
        .chartOverlay { proxy in
            GeometryReader { innerProxy in
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let location = value.location
                                if let day: String = proxy.value(atX: location.x) {
                                    if let currentItem = workoutData.first(where: { $0.day == day }) {
                                        self.selectedWorkOut = currentItem
                                    }
                                }
                            }
                            .onEnded { _ in
                                self.selectedWorkOut = nil
                            }
                    )
                    .onTapGesture {
                        if viewContext == .home {
                            isActive = true
                        }
                    }
            }
        }
        .navigationDestination(isPresented: $isActive) {
            WorkoutDetailsView()
        }
        .overlay(alignment: .top) {
            if let selectedWorkOut = selectedWorkOut {
                tooltipView(for: selectedWorkOut)
                    .offset(CGSize(width: 10.0, height: 10.0))
            }
        }
    }

    @ViewBuilder
    private func tooltipView(for data: WorkoutData) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            if data.currentWeekCompletion > data.lastWeekCompletion{
                HStack {
                    Text("\(data.day) - \(data.name)")
                        .padding(8)
                        .cornerRadius(8)
                        .shadow(radius: 3)
                        .foregroundStyle(.black)
                    Text("\(data.currentWeekCompletion)%")
                        .font(.title3.bold())
                        .foregroundStyle(.green)
                    Image(systemName: "arrow.up")
                        .foregroundStyle(.green)
                }
            }else {
                HStack {
                    Text("\(data.day) - \(data.name)")
                        .padding(8)
                        .cornerRadius(8)
                        .shadow(radius: 3)
                        .foregroundStyle(.black)
                    Text("\(data.currentWeekCompletion)%")
                        .font(.title3.bold())
                        .foregroundStyle(.red)
                    Image(systemName: "arrow.up")
                        .foregroundStyle(.red)
                }
            }

            ProgressBar(progress: Double(data.currentWeekCompletion) / 100, progressColor: Color.customBlue)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.clear)
                .shadow(radius: 3)
        }
        .background(Color.white)
        .cornerRadius(10, corners: .allCorners)
    }
}

#Preview {
    ReuseableChart(
        pastWeekLineBackground:Color.customPurple,
        currentWeekLineColor: Color.customGrey, lineBackground: Color.customPink,
        lineGradientColorStart: Color.customDark,
        lineGradientColorStop: Color.customBlue,
        pastWeekLineWidth: 2,currentWeekLineWidth: 4,
        chartBackGround: Color.customBlue
    )
}

struct WorkoutData: Identifiable, Equatable {
    let id = UUID()
    let day: String
    let currentWeekCompletion: Int
    let lastWeekCompletion: Int
    let name: String

    static func == (lhs: WorkoutData, rhs: WorkoutData) -> Bool {
        lhs.id == rhs.id
    }
}

let workoutData = [
    WorkoutData(day: "Sun", currentWeekCompletion: 50, lastWeekCompletion: 60, name: "Cardio"),
    WorkoutData(day: "Mon", currentWeekCompletion: 20, lastWeekCompletion: 30, name: "Legs"),
    WorkoutData(day: "Tue", currentWeekCompletion: 70, lastWeekCompletion: 80, name: "Rest"),
    WorkoutData(day: "Wed", currentWeekCompletion: 50, lastWeekCompletion: 40, name: "Abs"),
    WorkoutData(day: "Thu", currentWeekCompletion: 20, lastWeekCompletion: 50, name: "Chest"),
    WorkoutData(day: "Fri", currentWeekCompletion: 90, lastWeekCompletion: 80, name: "Shoulder"),
    WorkoutData(day: "Sat", currentWeekCompletion: 90, lastWeekCompletion: 70, name: "Cardio")
]


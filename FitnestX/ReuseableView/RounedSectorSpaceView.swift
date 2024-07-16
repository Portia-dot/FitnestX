//  RounedSectorSpaceView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-15.
//

import SwiftUI
import Charts

struct RoundedSectorSpaceView: View {
    var weight: Double
    var height: Double
    var heightUnit: String
    var weightUnit: String
    var maxBMI: Double = 40.0
    
    @State private var selectedCategory: String? = nil
    
    private var calculatedBMI: Double {
        let weightInKg = convertWeightToKg(weight: weight, unit: weightUnit)
        let heightInMeters = convertHeightToMeters(height: height, unit: heightUnit)
        return calculateBMI(weight: weightInKg, height: heightInMeters)
    }
    
    private var bmiData: [BMIdata] {
        [
            BMIdata(category: "Your BMI", amount: calculatedBMI),
            BMIdata(category: "Remaining", amount: maxBMI - calculatedBMI)
        ]
    }
    
    private var bmiStatus: String {
        switch calculatedBMI {
        case ..<18.5:
            return "Underweight"
        case 18.5..<25:
            return "Normal weight"
        case 25..<30:
            return "Overweight"
        default:
            return "Obesity"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("BMI (Body Mass Index)")
                        .font(.headline)
                        .foregroundStyle(Color.customDark)
                    Text("You have a \(bmiStatus.lowercased()) BMI")
                        .font(.subheadline)
                        .foregroundStyle(Color.customDark)
                    Button(action: {}, label: {
                        Text("View More")
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.customPurple)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
                Spacer()
                VStack {
                    Chart(bmiData) { element in
                        SectorMark(
                            angle: .value("Amount", element.amount),
                            angularInset: 3.0
                        )
                        .cornerRadius(6.0)
                        .foregroundStyle(by: .value("category", element.category))
                        .opacity(selectedCategory == element.category ? 1.1 : 1.0 )
                    }
                    .chartLegend(.hidden)
                    .frame(width: 100, height: 100)
                    .overlay {
                        Text(String(format: "%.1f", calculatedBMI))
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.customDark)
                    }
                }
                .padding(.trailing, 16) 
            }
            .padding()
            .background(
                LinearGradient(colors: [Color.customBlue.opacity(0.7), Color.customBlue.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal, 16) // Add horizontal padding around the entire view
        }
    }
    
    private func convertWeightToKg(weight: Double, unit: String) -> Double {
        switch unit.lowercased() {
        case "lbs":
            return weight * 0.453592
        default:
            return weight
        }
    }
    
    private func convertHeightToMeters(height: Double, unit: String) -> Double {
        switch unit.lowercased() {
        case "cm":
            return height / 100
        case "inches":
            return height * 0.0254
        default:
            return height
        }
    }
    
    private func calculateBMI(weight: Double, height: Double) -> Double {
        return weight / (height * height)
    }
}

#Preview {
    RoundedSectorSpaceView(weight: 80, height: 1.74, heightUnit: "m", weightUnit: "kg")
}

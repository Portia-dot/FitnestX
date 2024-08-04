//
//  WorkoutDetailsView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct WorkoutDetailsView: View {
    var workout: WorkoutData?

    var body: some View {
        VStack {
            ReuseableChart()
        }
    }
}
#Preview {
    WorkoutDetailsView()
}

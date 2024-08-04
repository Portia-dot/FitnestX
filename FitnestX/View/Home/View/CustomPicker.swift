//
//  CustomPicker.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct CustomPicker: View {
    @State private var selection: String = "Weekly"
   let period = ["weekly", "monthly", "yearly"]
    var body: some View {
        VStack{
            CustomPickerView(selection: $selection, period: period)
       
        }
    }
}

#Preview {
    CustomPicker()
}




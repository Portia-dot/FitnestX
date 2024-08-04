//
//  CustomPickerView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-03.
//

import SwiftUI

struct CustomPickerView: View {
    @State private var showPicker = false
    @Binding var selection: String
    var period: [String]
    var body: some View {
        VStack{
            Button(action: {
                showPicker = true
            }, label: {
                HStack{
                    Text(selection.capitalized)
                        .foregroundStyle(Color.customWhite)
                        .bold()
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .bold()
                        .foregroundStyle(Color.customWhite)
                }
//                .padding()
                .background(Color.customBlue)
                .cornerRadius(20, corners: .allCorners)
            })
            .confirmationDialog("Choose an option", isPresented: $showPicker, titleVisibility: .hidden) {
                ForEach(period, id: \.self){item in
                    Button(item.capitalized){
                        withAnimation{
                            selection = item
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    CustomPicker()
}

//
//  CheckBoxView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool
    var body: some View {
        Button {
            checked.toggle()
        } label: {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.gray)
        }

    }
}

struct CheckBoxView_Previews: PreviewProvider {
    @State static var check: Bool = true
    
    static var previews: some View {
        CheckBoxView(checked: $check)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

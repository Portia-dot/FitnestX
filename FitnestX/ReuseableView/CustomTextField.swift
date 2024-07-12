//
//  CustomTextField.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var imageName: String
    var isSecure: Bool = false
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.trailing)
                .foregroundStyle(.gray)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(.vertical)
            }else {
                TextField(placeholder, text: $text)
                    .padding(.vertical)
            }
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}






struct CustomTextFieldView: View {
    
    var imageName: String
    @Binding var value: String
    var dropDownItem: [String]  = ["item 1", "item 2", "item 3"]
    var placeholder: String
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.trailing)
                .foregroundStyle(.gray)
            Menu {
                ForEach(dropDownItem, id: \.self) { item in
                    Button(action: {
                        self.value = item
                    }) {
                        Text(item)
                    }
                }
            } label: {
                HStack {
                    Text(value.isEmpty ? placeholder : value)
                        .foregroundColor(value.isEmpty ? .gray : .black)
                        .padding(.vertical)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .background(Color.customGrey.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


struct CustomTextFieldView_Previews: PreviewProvider {
    @State static var value: String = ""

    static var previews: some View {
        CustomTextFieldView(imageName: "Profile", value: $value, placeholder: "Select an Item")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

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

struct CustomTextField_Previews: PreviewProvider {
    @State static var firstName: String = ""

    static var previews: some View {
        CustomTextField(text: $firstName, placeholder: "First Name", imageName: "Profile")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

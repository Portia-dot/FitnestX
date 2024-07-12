//
//  ProfileDetails.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-11.
//

import SwiftUI

struct ProfileDetails: View {
    @State private var selectedGender: String = ""
    @State private var dateOfBirth = Date.now
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var weightUnit: String = "KG"
    @State private var heightUnit: String = "CM"
    
    let genders = ["Male", "Female"]
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Image("Registration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Spacer()
            VStack(spacing: 20) {
                Text("Let's complete your profile")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("It will help us to know more about you!")
                    .font(.callout)
                    .foregroundColor(Color.gray)
                
                Spacer()
                HStack{
                    CustomTextFieldView(imageName: "2 User", value: $selectedGender, dropDownItem: genders, placeholder: "Choose Gender")
                }
                VStack{
                    HStack{
                        Image("Calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                            .foregroundStyle(.gray)
                        DatePicker(selection: $dateOfBirth, in:  ...Date.now, displayedComponents: .date){
                            Text("Select date of birth")
                                .foregroundStyle(Color.customGrey)
                        }
                        
                    }
                    .padding(9)
                    .background(Color.customGrey.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                HStack{
                    CustomTextField(text: $weight, placeholder: "Your Weight", imageName: "weight-scale 1")
                    Text(weightUnit)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.customGrey)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 12)
                        .background(Color.customPurple.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            toggleWeightUnit()
                        }
                    
                        
                }
                HStack{
                    CustomTextField(text: $height, placeholder: "Your Height", imageName: "Swap")
                    Text(heightUnit)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.customGrey)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 12)
                        .background(Color.customPurple.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            toggleHeightUnit()
                        }
                    
                        
                }
                Spacer()
                CustomButtonView(isTapped: .constant(false), buttonBackgroundColor: Color.customPurple, buttonTextColor: Color.white, label: "Next") {
                  
                }
            }
            .padding(.horizontal)
        }
        
                

    }
    
    private func toggleWeightUnit(){
        guard let currentWeight = Double(weight) else {return}
        
        if weightUnit == "KG"{
            weightUnit = "LB"
            weight = String(format: "%.2f", currentWeight * 2.20462)
        }else {
            weightUnit = "KG"
            weight = String(format: "%.2f", currentWeight / 2.20462)
        }
    }
    
    private func toggleHeightUnit() {
        guard let currentHeight = Double(height) else {return}
        if heightUnit == "CM" {
               heightUnit = "FT"
               height = String(format: "%.2f", currentHeight / 30.48)
           } else {
               heightUnit = "CM"
               height = String(format: "%.2f", currentHeight * 30.48)
           }
    }
}

#Preview {
    ProfileDetails()
}

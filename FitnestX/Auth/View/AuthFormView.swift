//
//  AuthFormView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct AuthFormView: View {
    
    enum AuthMode {
        case login
        case register
    }
    
    var mode: AuthMode
    var fields: [AuthField]
    var isChecked: Binding<Bool>
    var buttonAction: () -> Void
    var secondaryAction: () -> Void
    
    @State private var isTapped = false
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            
            if mode == .register {
                Text("Hey There")
                    .font(.callout)
                    .fontWeight(.regular)
                Text("Create an Account")
                    .font(.title)
                    .fontWeight(.bold)
            }else{
                Text("Welcome Back")
                    .font(.callout)
                    .fontWeight(.regular)
                Text("Login your Account")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            Spacer()
            ForEach(fields) { field in
                CustomTextField(text: field.text, placeholder: field.placeholder, imageName: field.imageName, isSecure: field.isSecure)
            }
            if mode == .register {
                HStack{
                    CheckBoxView(checked: isChecked)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By continuing you accept our Privacy Policy and Term of use")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .onTapGesture {
                                    
                                }
                        }
                    }
                }
            }
            //Reset Password Logic
        
            if mode ==  .login {
                Text("Forgot your password? ")
                    .foregroundColor(.customGrey)
                    .underline()
                    .onTapGesture {
                        
                    }
            }
            Spacer()
            CustomButtonView(isTapped: $isTapped, buttonBackgroundColor: Color.customBlue, buttonTextColor: Color.white, label: mode == .register ? "Register" : "Login") {
                buttonAction()
            }
            Text("Or")
                .font(.footnote)
                .foregroundStyle(Color.customGrey)
                .padding(.bottom, 30)
            HStack(spacing: 60){
                //Google Login 
                Button {
                    
                } label: {
                    Image("google")
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .frame(width: 50, height: 50)
                            
                            
                        }
                }
                
                //Facebook Login
                
                Button {
                    
                } label: {
                    Image("facebook")
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.customPurple)
                        }
                    
                }
                
                
            }
            
            Spacer()
            HStack{
                if mode == .register{
                    Text("Already have an account")
                        .foregroundStyle(Color.customBlue)
                    Text("Login")
                        .foregroundStyle(Color.customGrey)
                        .underline()
                        .onTapGesture {
                        secondaryAction()
                        }
                }else{
                    Text("Don't have an account?")
                        .foregroundColor(.customBlue)
                    Text("Register")
                        .foregroundColor(.customGrey)
                        .underline()
                        .onTapGesture {
                            secondaryAction()
                        }
                }
            }
            .font(.footnote)
            
            Spacer(minLength: 10)
        }
        .padding(.horizontal, 20)
    }
}


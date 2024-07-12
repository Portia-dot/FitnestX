//
//  MainView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct MainViewAuth: View {
    
    @State private var authMode: AuthFormView.AuthMode = .register
    
    var body: some View {
        NavigationStack {
                    if authMode == .login {
                        LoginView(authMode: $authMode)
                    } else {
                        RegisterView(authMode: $authMode)
                    }
                }
        .animation(.easeInOut(duration: 0.5), value: authMode)
        .navigationBarBackButtonHidden()
            }
    }

#Preview {
    MainViewAuth()
}


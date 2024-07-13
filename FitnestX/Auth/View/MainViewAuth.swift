//
//  MainView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-10.
//

import SwiftUI

struct MainViewAuth: View {
    @EnvironmentObject var auth: RegistrationAuth
    @State private var authMode: AuthFormView.AuthMode = .register
    
    var body: some View {
        NavigationStack {
                    if authMode == .login {
                        LoginView(authMode: $authMode)
                            .environmentObject(auth)
                    } else {
                        RegisterView(authMode: $authMode)
                            .environmentObject(auth)
                    }
                }
        .animation(.easeInOut(duration: 0.5), value: authMode)
        .navigationBarBackButtonHidden()
            }
    }

#Preview {
    MainViewAuth()
}


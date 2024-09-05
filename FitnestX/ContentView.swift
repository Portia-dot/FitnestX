//
//  ContentView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var auth :RegistrationAuth 
    var body: some View {
        Group{
            if auth.userSession == nil{
                IntroScreen()
            }else{
                MainTabView()
            }
        }
        .alert("Logged Out", isPresented: $auth.showLogOutAlert){
            Button("Ok", role: .cancel){}
        }message: {
            Text("You have been logged out Please Log in again")
        }

    }
}

#Preview {
    ContentView()
        .environmentObject(RegistrationAuth.shared)
}




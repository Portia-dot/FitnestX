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
                    .environmentObject(auth)
            }else{
                MainTabView()
                    .environmentObject(auth)
            }
        }
        .alert("Logged Out", isPresented: $auth.showLogOutAlert){
            Button("Ok", role: .cancel){}
        }message: {
            Text("You have been logged out Please Log in again")
        }
        .onAppear{
            print("\(auth.userSession)")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(RegistrationAuth())
}




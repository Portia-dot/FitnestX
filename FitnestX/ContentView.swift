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
        NavigationStack{
            if auth.userSession == nil{
                IntroScreen()
                    .environmentObject(auth)
            }else{
                MainTabView()
                    .environmentObject(auth)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(RegistrationAuth())
}




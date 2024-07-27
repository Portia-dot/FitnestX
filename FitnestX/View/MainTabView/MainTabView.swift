//
//  MainTabView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var auth: RegistrationAuth
    
    init () {
        UITabBar.appearance().isHidden = true
    }
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex){
            if let user = auth.currentUser{
                HomeView(user: user)
                    .tag(0)
            }else{
                Text("Loading")
                    .foregroundStyle(.red)
                    .tag(0)
            }
            ActivityView()
                .tag(1)
            ProgressTracker()
                .tag(2)
            if let user = auth.currentUser{
                Profile(user: user)
                    .tag(3)
            }else{
                Text("Loading.....")
                    .foregroundStyle(.red)
                    .tag(3)
            }
            
        }
        .onChange(of: selectedIndex) { oldIndex, newIndex in
            if newIndex == 0 {
                auth.fetchUser()
            }
        }
        .ignoresSafeArea()
        CustomTabBar(selectedIndex: $selectedIndex)
        
    }
}

#Preview {
    MainTabView()
        .environmentObject(RegistrationAuth())
}

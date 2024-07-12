//
//  MainTabView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct MainTabView: View {
    init () {
        UITabBar.appearance().isHidden = true
    }
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex){
            HomeView()
                .tag(0)
            
            ActivityView()
                .tag(1)
            ProgressTracker()
                .tag(2)
            Profile()
                .tag(3)
        }
        .ignoresSafeArea()
        CustomTabBar(selectedIndex: $selectedIndex)
    }
}

#Preview {
    MainTabView()
        .environmentObject(RegistrationAuth())
}

//
//  ContentView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-09.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        NavigationStack{
            if isFirstTime {
                IntroScreen()
            }else{
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}

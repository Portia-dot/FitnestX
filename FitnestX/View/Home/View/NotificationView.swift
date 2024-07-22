//
//  NotificationView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-21.
//

import SwiftUI

struct NotificationView: View {
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Notification View")
        }
        .navigationTitle("Notification")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("Back-Navs")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.customGrey)
                        }
                    }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image("More Circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color.customGrey)
                }

            }
                }
        
        

        
    }
}

#Preview {
    NotificationView()
}

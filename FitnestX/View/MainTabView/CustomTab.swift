//
//  CustomTab.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    //NameSpace Animation For Sliding
    @Namespace var animation
    var body: some View {
        HStack(spacing: 0){
            TabBarButton(animation: animation, image: "Home", index: 0, selectedIndex: $selectedIndex)
            TabBarButton(animation: animation, image: "Activity", index: 1, selectedIndex: $selectedIndex)
            
            //Add Button
            Button(action: {
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(20)
                    .background(Color.customPurple)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: -5, y: 5)
                
            })
            .offset(y: -30)
            
            TabBarButton(animation: animation, image: "Camera", index: 2, selectedIndex: $selectedIndex)
            TabBarButton(animation: animation, image: "Profile", index: 3, selectedIndex: $selectedIndex)
        }
        .padding(.top)
        .padding(.vertical, -15)
//        .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        .background(Color.clear)
        
    }
}

#Preview {
    CustomTabBar(selectedIndex: .constant(0))
}


struct TabBarButton: View {
    var animation: Namespace.ID
    var image: String
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View{
        Button {
            withAnimation(.spring()) {
                selectedIndex = index
            }
           
        } label: {
            
            VStack(spacing: 6) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(selectedIndex == index ? Color.customPurple : Color.customGrey)
                .frame(width: 20, height: 20)
                if selectedIndex == index {
                    Capsule()
                        .fill(Color(.systemPink))
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
            }
            .frame(maxWidth: .infinity)
        }

    }
}

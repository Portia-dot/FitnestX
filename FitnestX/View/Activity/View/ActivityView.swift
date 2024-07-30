//
//  Activity.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-12.
//

import SwiftUI

struct ActivityView: View {
    @Environment (\.dismiss) var dismiss
    let lastest: [LatestActivityData] = LatestActivityData.sampleData
    @State private var showFullActivity = false

    let horizontalPadding: CGFloat = 20
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading, spacing: 20){
                targetView()
                ActivityProgressView()
                   .frame(width: UIScreen.main.bounds.width - 2 * horizontalPadding, height: 350)
                latestActivity
            }
            .padding(.horizontal, horizontalPadding)
            .navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        .sheet(isPresented: $showFullActivity) {
            ActivityDetailsView()
        }

    }
    @ViewBuilder
    func targetReuseable(imageName: String, title: String, objective: String) -> some View {
        HStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading){
                Text(objective)
                    .font(.footnote)
                    .foregroundStyle(Color.customPurple)
                    .bold()
                Text(title)
                    .font(.footnote)
                    .foregroundStyle(Color.customGrey)
                    .bold()
            }
            
        }
        .padding()
        .background(Color.customWhite.opacity(0.9))
        .cornerRadius(10, corners: .allCorners)
    }
    
    @ViewBuilder
    func targetView() -> some View {
        VStack{
            HStack{
                Text("Today Target")
                    .font(.title3)
                    .foregroundStyle(Color.customDark)
                    .bold()
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.customBlue)
                        .frame(width: 35, height: 35)
                    Image(systemName: "plus")
                        .font(.title3)
                        .foregroundStyle(Color.customWhite)
                        .bold()
                    
                }
                .padding(.leading, 10)
            }
//            .padding()
            HStack(spacing: 10){
                targetReuseable(imageName: "Layer", title: "Water Intake", objective: "8L")
                
                targetReuseable(imageName: "boots", title: "Foot Steps", objective: "2400")
            }
    
        }
        .padding()
        .background(Color.customBlue.opacity(0.3))
        .cornerRadius(15, corners: .allCorners)

    }
    
    @ViewBuilder
    func reuseableCard(activity: LatestActivityData) -> some View {
        VStack(alignment:.leading){
            HStack{
                Image(activity.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                VStack(alignment:.leading){
                    Text(activity.title)
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(Color.customDark)
                    Text(activity.timeAgo)
                        .font(.caption)
                        .foregroundStyle(Color.customGrey)
                }
                .padding(.horizontal)
                Spacer()
                Image("more-vertical")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 10, height: 20)
            }
            .padding()
            .background(Color.customWhite)
            .cornerRadius(15, corners: .allCorners)
        }
        .padding(.bottom, 10)
        
    }
    
    @ViewBuilder
    func ActivityDetailsView() -> some View {
        @Environment (\.dismiss) var dismiss
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(lastest, id: \.timeAgo){activity in
                        reuseableCard(activity: activity)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal)
                .navigationTitle("All Activities")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                           //Dismiss Sheet
                            $showFullActivity.wrappedValue = false
                        }) {
                            Image("Back-Navs")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.customGrey)
                        }
                    }
                }
            }
        }
        
    }
    
    
    private var latestActivity: some View {
        VStack(spacing: 10){
            HStack{
                Text("Latest Activity")
                    .font(.title3)
                    .bold()
                Spacer()
                Button("See more"){
                    withAnimation(.spring()){
                        showFullActivity = true
                    }
                    
                }
                    .font(.footnote)
                    .foregroundStyle(Color.customGrey)
            }
            .padding(.bottom)
            ForEach(lastest.prefix(2), id: \.timeAgo){activity in
                reuseableCard(activity: activity)
            }
            
        }
    }
}

#Preview {
    ActivityView()
}

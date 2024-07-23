//
//  NotificationView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-21.
//

import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let timeStamp: Date
}

struct NotificationView: View {
    @Environment (\.dismiss) var dismiss
    
    let notifications = [
        Notification(imageName: "Ellipse", title: "New Message from John", timeStamp: Date().addingTimeInterval(-300)),
        Notification(imageName: "Ellipse-1", title: "Dont miss your lowerbody workout", timeStamp: Date().addingTimeInterval(-9000)),
        Notification(imageName: "Ellipse-2", title: "Hey its lunch time", timeStamp: Date().addingTimeInterval(-3600)),
        Notification(imageName: "Ellipse-3", title: "Congratulation you have finshed your  abs workout", timeStamp: Date().addingTimeInterval(-86400))
       ]
    
    
    var body: some View {
        VStack{
            ForEach(notifications) { notification in
                NotificationsView(notification: notification)
            }
            Spacer()
        }
        .padding(.top)
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

struct NotificationsView: View {
    
    var notification: Notification

    var body: some View {
        HStack(spacing: 20){
            Image(notification.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60 )
            VStack(alignment: .leading, spacing: 10){
                Text(notification.title)
                    .font(.caption)
                    .foregroundStyle(Color.customDark)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Text(timeAgo(since: notification.timeStamp))
                    .font(.caption)
                    .foregroundStyle(Color.customGrey)
                
            }
            Spacer()
            Menu{
                Button("Delete", action: deleteNotification)
                Button("View", action: viewNotification)
            }label: {
                            Image("More Circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                
            }
        }
        .padding(.horizontal)
        Divider()
    }
    //Delete Notification
    
    func deleteNotification(){
        
    }
    
    //View Notification
    func viewNotification(){
        
    }
    //Time Ago
    func timeAgo(since date: Date) -> String{
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

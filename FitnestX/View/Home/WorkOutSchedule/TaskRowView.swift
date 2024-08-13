//
//  TaskRowView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-11.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task
    var body: some View {
        HStack(alignment: .top, spacing: 15){
            Circle()
                .fill()
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: Color.customBlue.opacity(0.1), radius: 3)), in: .circle)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.customDark)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(Color.customDark)
                    .fontWeight(.bold)
            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tint, in:.rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: Color.customDark)
            .offset(y: -8)
        }
        
    }
}

#Preview {
    WorkOutScheduleView()
}

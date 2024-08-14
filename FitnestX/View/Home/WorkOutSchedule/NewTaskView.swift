//
//  NewTaskView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-13.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: Color = Color.customBlue
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            }
            .hSpacing(.leading)
            VStack(alignment: .leading, spacing: 8){
                Text("Enter Execise")
                    .font(.caption)
                    .foregroundStyle(Color.customGrey)
                TextField("Abs Workout", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
            }
            .padding(.top, 5)
            HStack(spacing: 8){
                VStack(alignment: .leading, spacing: 8){
                    Text("Execise Date")
                        .font(.caption)
                        .foregroundStyle(Color.customGrey)
                    TextField("Abs Workout", text: $taskTitle)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                }
                .padding(.top, 5)
                VStack(alignment: .leading, spacing: 8){
                    Text("Execise Color")
                        .font(.caption)
                        .foregroundStyle(Color.customGrey)
                    TextField("Abs Workout", text: $taskTitle)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                }
                .padding(.top, 5)
            }
        })
        .padding(15)
        
    }
}

#Preview {
    NewTaskView()
        .vSpacing(.bottom)
}

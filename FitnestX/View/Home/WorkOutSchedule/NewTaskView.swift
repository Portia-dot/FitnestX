//
//  NewTaskView.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-13.
//

import SwiftUI

struct NewTaskView: View {
    @EnvironmentObject var auth: RegistrationAuth
    
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
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                .padding(.top, 5)
                .padding(.trailing, -15)
                VStack(alignment: .leading, spacing: 8){
                    Text("Execise Color")
                        .font(.caption)
                        .foregroundStyle(Color.customGrey)
                    
                    let colors: [Color] = [Color.customDark, Color.customPink, Color.customBlue, Color.customLightBlue]
                    HStack(spacing: 0, content: {
                        ForEach(colors, id: \.self) {color in
                        Circle()
                                .fill(color)
                                .frame(width:20, height: 20)
                                .background{
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor ==  color ? 1 : 0)
                                }
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy){
                                        taskColor = color
                                    }
                                }
                        }
                    })
                }

            }
            
            .padding(.top, 5)
            Spacer(minLength: 0)
            Button {
                addNewTask()
            } label: {
                Text("Create Execise")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(Color.customWhite)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(taskColor, in: .rect(cornerRadius: 10))
            }
            .disabled(taskTitle == "")
            .opacity(taskTitle ==  "" ? 0.5 : 1)

        })
        .padding(15)
        
    }
    private func addNewTask() {
           guard let currentUser = auth.userSession else {  
               print("No user session found")
               return
           }
           
           let newTask = Task(
               id: UUID(),
               taskTitle: taskTitle,
               creationDate: Date(),
               isCompleted: false,
               tint: taskColor,
               userId: currentUser.uid
           )
           
           auth.addTask(newTask) { result in
               switch result {
               case .success:
                   print("Task added successfully")
                   dismiss()
               case .failure(let error):
                   print("Failed to add task: \(error.localizedDescription)")
               }
           }
       }
}

#Preview {
    NewTaskView()
        .environmentObject(RegistrationAuth())
        .vSpacing(.bottom)
}

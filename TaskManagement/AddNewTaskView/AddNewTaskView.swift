//
//  AddNewTaskView.swift
//  TaskManagement
//
//  Created by Malik Farrukh on 12/31/24.
//

import SwiftUI

struct AddNewTaskView: View {
    @State private var selectedColor: Color = .yellow
    @State private var deadline: Date = Date()
    @State private var taskTitle: String = ""
    @State private var priority: String = "Basic"
    let priorityOptions = ["Basic", "Urgent", "Important"]
    let colors: [Color] = [.yellow, .green, .blue, .purple, .red, .orange]
    
    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            HStack {
                Button(action: {
                    // Handle back action
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Edit Task")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Task Color Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Task Color")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                HStack(spacing: 15) {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: selectedColor == color ? 2 : 0)
                            )
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            // Deadline Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Task Deadline")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                HStack {
                    Text(deadline, style: .date)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        // Action to open date picker
                    }) {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .padding(.horizontal)
            
            // Task Title Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Task Title")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                TextField("Enter task title", text: $taskTitle)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            // Priority Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Task Priority")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                HStack(spacing: 10) {
                    ForEach(priorityOptions, id: \.self) { option in
                        Text(option)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(priority == option ? .white : .black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(priority == option ? Color.black : Color.clear)
                            .cornerRadius(8)
                            .overlay(
                                Capsule()
                                    .stroke(priority == option ? Color.black : Color.gray, lineWidth: 1)
                            )
                            .onTapGesture {
                                priority = option
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            // Save Button
            Button(action: {
                // Handle save task
            }) {
                Text("Save Task")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddNewTaskView()
}

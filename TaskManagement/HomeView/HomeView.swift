//
//  HomeView.swift
//  TaskManagement
//
//  Created by Malik Farrukh on 12/31/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentTab: String = "Today"
    @State private var tasks: [Task] = [
        Task(title: "Buy groceries", category: "Today", backgroundColor: .yellow),
        Task(title: "Finish project report", category: "Today", backgroundColor: .yellow),
        Task(title: "Plan weekend trip", category: "Upcoming", backgroundColor: .green),
        Task(title: "Submit tax documents", category: "Upcoming", backgroundColor: .green),
        Task(title: "Morning workout", category: "Complete", backgroundColor: .blue),
        Task(title: "Meeting with team", category: "Complete", backgroundColor: .blue),
        Task(title: "Missed client call", category: "Failed", backgroundColor: .red)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome Back")
                        .font(.callout)
                        .foregroundColor(.black.opacity(0.7))
                    Text("Here's Update Today.")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Segmented Control
                CustomSegmentedBar(currentTab: $currentTab)
                    .padding(.top, 15)
                
                // Tasks Section
                ScrollView {
                    if tasks.filter { $0.category == currentTab }.isEmpty {
                        Text("No tasks found!!!")
                            .foregroundColor(.gray)
                            .font(.callout)
                            .padding(.top, 50)
                    } else {
                        ForEach(tasks.filter { $0.category == currentTab }) { task in
                            Text(task.title)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(task.backgroundColor.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .padding(.top, 10)
                        }
                    }
                }
                .padding(.top, 20)
                
                // Add Task Button
                NavigationLink(destination: AddNewTaskView()) {
                    Label("Add Task", systemImage: "plus.app.fill")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
        }
    }
}

// Task Model
struct Task: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let backgroundColor: Color
}

struct CustomSegmentedBar: View {
    @Binding var currentTab: String
    let tabs = ["Today", "Upcoming", "Complete", "Failed"]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == tab ? .white : .black)
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .fill(currentTab == tab ? Color.black : Color.clear)
                    )
                    .onTapGesture {
                        currentTab = tab
                    }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}

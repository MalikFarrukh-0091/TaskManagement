//
//  HomeView.swift
//  TaskManagement
//
//  Created by Malik Farrukh on 12/31/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentTab: String = "Today"
    @State private var tasks: [String] = [] // Replace this with your task model if available
    
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
                    if tasks.isEmpty {
                        Text("No tasks found!!!")
                            .foregroundColor(.gray)
                            .font(.callout)
                            .padding(.top, 50)
                    } else {
                        ForEach(tasks, id: \.self) { task in
                            Text(task) // Replace with your custom task row
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.2))
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

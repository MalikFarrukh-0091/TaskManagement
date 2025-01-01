//
//  ContentView.swift
//  TaskManagement
//
//  Created by Malik Farrukh on 17/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var navigate = false
    var body: some View {
        NavigationStack {
            VStack {
                Image("Component 1")
                    .resizable()
                    .scaledToFill()
                Text("Task\nManagement")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(" This productive tool is designed to help you better manage your task project-wise conveniently!")
                    .font(.subheadline)
            
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            navigate = true
                        }
                    })
            }
            .padding(EdgeInsets(.init(top: 50, leading: 10, bottom: 150, trailing: 10)))
            .background(Color("backGround_color", bundle: nil))
            .navigationDestination(isPresented: $navigate) {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  TaskDetailsScreen_mac.swift
//  Light_Navigation_Architecture_on_Mac (macOS)
//
//  Created by User on 05/08/2021.
//

import SwiftUI

struct TaskDetailsScreen_mac: View {
    
    @EnvironmentObject var container: Container
    @State var taskName: String = ""
    @State var taskDescription: String = ""

    var body: some View {
        TextField("Provide task name", text: $taskName)
            .frame(width: 200, height: 40)
        TextField("Provide task description", text: $taskDescription)
            .frame(width: 200, height: 40)
        MacButton(action: {
            container.taskInteractor.add(task: Task(name: taskName, description: taskDescription, parentProject: ""))
        }, label: "Create")
    }
    
}

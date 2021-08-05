//
//  TaskScreen.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import Combine
import SwiftUI
import UIKit

protocol MyView: View {
    var type: SType { get set }
}

struct TasksScreen: MyView {
    
    var type = SType.tasks
    
    @EnvironmentObject var router: Router
    @Environment(\.container) private var container: Container
    
    @State private var tasksNames: [String] = []
    @State private var newTask: String = ""
    
    private var bag = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            List {
                ForEach(tasksNames, id: \.self) { task in
                    Text(task)
                }
            }
            TextField("new task", text: $newTask)
                .textFieldStyle(CustomTextfieldStyle())
            Button {
                let task = Task(name: newTask, description: "subtitle", parentProject: "nil")
                container.taskInteractor.add(task: task)
            } label: {
                Text("Add Task")
            }.buttonStyle(CustomButtonStyle(color: .green))
            Button { router.route(from: type) } label: {
                Text("Next")
            }
            .buttonStyle(CustomButtonStyle())
            .padding(.bottom, 16)
        }
        .modifier(NavigationBarModifier(type.title))
        .onReceive(tasksPublisher, perform: { tasksNames = $0.map { $0.name ?? "-" } } )
    }
    
    private var tasksPublisher: AnyPublisher<[Task], Never> {
        container.appState.tasksSubject
            .eraseToAnyPublisher()
    }
    
}


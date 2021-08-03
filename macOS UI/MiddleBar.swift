//
//  MiddleBar.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 04/08/2021.
//
import Combine
import SwiftUI

struct MiddleBar: View {
    
    @EnvironmentObject var container: Container
    @EnvironmentObject var macRouter: MacRouter
    
    @State private var tasksNames: [String] = []
    @State private var projectsNames: [String] = []

    var body: some View {
        VStack {
            Text(String(macRouter.type.title ?? "-"))
            if macRouter.type == .tasks {
                List {
                    ForEach(tasksNames, id: \.self) { task in
                        Text(task)
                    }
                }
            } else {
                List {
                    ForEach(projectsNames, id: \.self) { task in
                        Text(task)
                    }
                }
            }
            HStack {
                Button {
                    let task = Task(name: "newTask", subtitle: "subtitle", parentProject: "nil")
                    container.taskInteractor.add(task: task)
                } label: { Text("Add task").padding() }
                Button {
                    let pr = Project(name: "prjct", description: "jgf", tasks: [])
                    container.projectsInteractor.add(project: pr)
                } label: { Text("Add project").padding() }
            }.buttonStyle(PlainButtonStyle())

        }
        .onReceive(tasksPublisher, perform: { tasksNames = $0.map { $0.name ?? "-" } } )
        .onReceive(projectsPublisher, perform: { projectsNames = $0.map { $0.name ?? "-" } } )
    }
    
    private var tasksPublisher: AnyPublisher<[Task], Never> {
        container.appState.tasksSubject
            .eraseToAnyPublisher()
    }
    
    private var projectsPublisher: AnyPublisher<[Project], Never> {
        container.appState.projectsSubject
            .eraseToAnyPublisher()
    }
    
}

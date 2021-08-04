//
//  MiddleBar.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 04/08/2021.
//
import Combine
import SwiftUI

struct MiddleBarScreen: View {
    
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
            bottomBar
        }
        .onReceive(tasksPublisher, perform: { tasksNames = $0.map { $0.name ?? "-" } } )
        .onReceive(projectsPublisher, perform: { projectsNames = $0.map { $0.name ?? "-" } } )
    }
    
    private var bottomBar: some View {
            return HStack {
                switch container.macRouter.type {
                case .tasks:
                    MacButton(action: {
                        container.taskInteractor.add(task: Task(name: "1", subtitle: "2", parentProject: "3"))
                    }, label: "Add Task")
                case .projects:
                    MacButton(action: {
                        container.projectsInteractor.add(project: Project(name: "p1", description: "p2", tasks: []))
                    }, label: "Add Project")
                default:
                    MacButton(action: {
                        print("filter adsgf")
                    }, label: "Add Input")

            }
        }
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

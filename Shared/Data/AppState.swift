//
//  AppState.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import Combine
import Foundation

class AppState {
    
    // AppState should be composed to different subcontext like screens in the future
    
    var tasksSubject: CurrentValueSubject<[Task], Never> = CurrentValueSubject([])
    var projectsSubject: CurrentValueSubject<[Project], Never> = CurrentValueSubject([])

    private var projects = [Project]()  { didSet { projectsSubject.send(projects) }}
    private var tasks: [Task] = [] { didSet { tasksSubject.send(tasks) }}
    
    private var bags = Set<AnyCancellable>()
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func addProject(_ project: Project) {
        projects.append(project)
    }
    
}

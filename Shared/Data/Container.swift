//
//  Container.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import Combine
import SwiftUI

class Container: ObservableObject {
    
    let appState = AppState()
    
    let taskInteractor: TasksInteractor
    let projectsInteractor: ProjectsInteractor
    
#if os(iOS)
    let routerInbox = Router()
    let routerTasks = Router()
    let routerProjects = Router()
#elseif os(macOS)
    @Published var macRouter = MacRouter()
#endif
    
    //    static var defaultValue: Self {
    //        Self()
    //    }
    
    init() {
        self.taskInteractor = TasksInteractor(appstate: appState)
        self.projectsInteractor = ProjectsInteractor(appstate: appState)
    }
    
}

class MacRouter: ObservableObject {
    
    @Published var type: SType = .tasks {
        didSet {
            print("filter type: \(type)")
        }
    }
    
}

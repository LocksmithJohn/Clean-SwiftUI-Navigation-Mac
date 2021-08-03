//
//  ScreenFactory.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import SwiftUI

struct ScreenFactory {
    
    static func make(type: SType, router: Router) -> AnyView {
        switch type {
        case .tasks:
            return AnyView(TasksScreen().environmentObject(router))
        case .projects:
            return AnyView(ProjectsScreen().environmentObject(router))
        case .inbox:
            return AnyView(InboxScreen().environmentObject(router))
        case .taskDetails:
            return AnyView(TaskDetailsScreen().environmentObject(router))
        case .projectDetails:
            return AnyView(ProjectDetailsScreen().environmentObject(router))
        case .inputDetails:
            return AnyView(InputDetailsScreen().environmentObject(router))
        }
    }
    
}

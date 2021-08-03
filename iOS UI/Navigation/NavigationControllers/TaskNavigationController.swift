//
//  TaskNavigationController.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import SwiftUI

struct TasksNavigationController: NavigationController {
    
    @EnvironmentObject var router: Router
    
    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {
        snapShotStackView(navigationController: navigationController, router: router)
    }
    
    func setInitialView() {
        router.setInitial(.tasks)
    }
 
}

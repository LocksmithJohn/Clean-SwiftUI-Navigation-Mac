//
//  CanvasView.swift
//  Light_Navigation_Architecture_on_Mac (macOS)
//
//  Created by User on 04/08/2021.
//

import SwiftUI

struct CanvasScreen: View {
    
    @EnvironmentObject var container: Container
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            switch router.type {
            case .tasks:
                TaskDetailsScreen_mac()
            case .projects:
                Text("Projects")
            default:
                Text("Inboxes")
            }
        }
    }
    
}

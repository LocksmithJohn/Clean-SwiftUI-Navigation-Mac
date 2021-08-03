//
//  MiddleBar.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 04/08/2021.
//

import SwiftUI

struct MiddleBar: View {
    
    @EnvironmentObject var container: Container

    var body: some View {
        VStack {
            Text(String(container.macRouter.type.title ?? "-"))
        switch container.macRouter.type {
        case .inbox:
            Text("Tutaj Inbox")
        case .tasks:
            Text("Tutaj Taski")
        default:
            Text("Tutaj Projekty")
        }
        }
    }

}

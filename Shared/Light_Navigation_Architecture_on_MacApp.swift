//
//  Light_Navigation_Architecture_on_MacApp.swift
//  Shared
//
//  Created by User on 03/08/2021.
//

import SwiftUI

let container = Container()

@main
struct Light_Navigation_Architecture_on_MacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(container: container)
                .ignoresSafeArea()
        }
    }
}

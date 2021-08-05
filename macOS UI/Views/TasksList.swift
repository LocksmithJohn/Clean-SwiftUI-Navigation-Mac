//
//  MiddleBarList.swift
//  Light_Navigation_Architecture_on_Mac (macOS)
//
//  Created by User on 04/08/2021.
//

import SwiftUI

struct TasksList: View {
    
    @Binding var tasksNames: [String]

    var body: some View {
        List {
            ForEach(tasksNames, id: \.self) { task in
                Text(task)
            }
        }
    }
    
}

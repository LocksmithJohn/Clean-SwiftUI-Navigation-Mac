//
//  SideBar.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import SwiftUI

struct SideBar: View {
    
    @EnvironmentObject var container: Container

    var body: some View {
            List {
                button(imageName: "1.circle", type: .inbox)
                button(imageName: "2.circle", type: .tasks)
                button(imageName: "3.circle", type: .projects)
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 150, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            .padding(.top, 16)
    }
    
    private func button(imageName: String, type: SType) -> some View {
        Button {
            container.macRouter.type = type
        } label: {
//            VStack {
                Image(systemName: imageName)
//            }

        }
        .frame(width: 40, height: 30)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}

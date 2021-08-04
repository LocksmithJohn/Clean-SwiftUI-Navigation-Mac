//
//  SideBar.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import SwiftUI

struct SideBarScreen: View {
    
    @EnvironmentObject var macRouter: MacRouter
    
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
            macRouter.type = type
        } label: {
            HStack {
                Image(systemName: imageName)
                Text(type.title ?? "").padding()
            }
        }

        .buttonStyle(LinkButtonStyle())
    }
}

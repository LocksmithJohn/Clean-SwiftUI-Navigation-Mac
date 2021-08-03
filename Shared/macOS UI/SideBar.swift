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
//        NavigationView {
            List {
                Text("jkhgnkgh").padding()
                Text("jkhgnkgh").padding()
                Text("jkhgnkgh").padding()
                Text("jkhgnkgh").padding()
                Text("jkhgnkgh").padding()
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 150, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            .padding(.top, 16)
//        }
    }
}

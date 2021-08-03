//
//  ContentView.swift
//  Shared
//
//  Created by User on 03/08/2021.
//

import SwiftUI

struct ContentView: View {
    let container: Container
    var body: some View {
#if os(macOS)
        NavigationView {
        SideBar().environmentObject(container)
        List {
            Text("jeden").padding()
            Text("dwa").padding()
            Text("trzy").padding()
            Text("cztery").padding()
        }
    }
#else
        TabBar().environmentObject(container)
#endif
    }
}

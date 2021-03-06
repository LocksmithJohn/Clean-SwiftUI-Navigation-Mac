//
//  InboxScreen.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import SwiftUI

struct InboxScreen: MyView {
    var type = SType.inbox
    
    @EnvironmentObject var router: Router
    @Environment(\.injected) private var injected: Container
    
    var body: some View {
        VStack {
            Button {
                router.route(from: type)
            } label: {
                Text("Go to Input details")
            }.buttonStyle(CustomButtonStyle())
                .padding(.bottom, 16)
        }
        .modifier(NavigationBarModifier(type.title))
//        .onDisappear { router.hideModal() }
    }
}

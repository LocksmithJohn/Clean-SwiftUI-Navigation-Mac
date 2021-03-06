//
//  StackScreenViewController.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import Foundation
import SwiftUI

class StackScreenViewController: UIHostingController<AnyView> {
    var router: Router
    var type: SType { didSet {
        rootView = ScreenFactory.make(type: type, router: router)
    } }

    init(router: Router, type: SType) {
        self.router = router
        self.type = type
        super.init(rootView: ScreenFactory.make(type: type, router: router))
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.title = type.title
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
}

class Screen: Equatable {
    
    var isModal = false
    var type = SType.tasks
    
    init(type: SType) {
        self.type = type
    }
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.type == rhs.type
    }
    
}

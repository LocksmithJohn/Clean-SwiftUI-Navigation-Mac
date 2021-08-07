//
//  Models.swift
//  Light_Navigation_Architecture_on_Mac
//
//  Created by User on 03/08/2021.
//

import Foundation

struct Project: Equatable {
    var name: String = ""
    var description: String? = nil
    var tasks: [Task]
}

struct Task: Equatable {
    var name: String = ""
    var description: String? = nil
    var parentProject: String = ""
}

struct Input: Equatable {
    var name: String = ""
    var description: String? = nil
}


//
//  User.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}


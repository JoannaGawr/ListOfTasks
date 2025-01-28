//
//  ListOfTasksItem.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import Foundation


struct ListOfTasksItem: Codable, Identifiable {
    let id: String
    let title: String
    let duDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_state: Bool) {
        isDone = _state
        
    }
}

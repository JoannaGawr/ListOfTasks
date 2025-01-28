//
//  ListOfTasksApp.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import FirebaseCore
import SwiftUI

@main
struct ListOfTasksApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
            
        }
    }
}

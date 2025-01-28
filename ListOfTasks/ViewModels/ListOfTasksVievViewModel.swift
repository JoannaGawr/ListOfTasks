//
//  ListOfTasksVievViewModel.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//
import FirebaseFirestore
import Foundation

//View model for list of items view
//Primary tab

class ListOfTasksViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    /// Delete list of tasks item
    /// ///- Parameter id: item to delete
    func delete(id: String) {
            let db = Firestore.firestore()
        
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(id)
                .delete()
    }
}

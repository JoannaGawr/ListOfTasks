//
//  NewItemViewViewModel.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    init() {}
        
        func save() {
            guard canSave else {
                return
            }
            //Get current user id
            
            guard let uId = Auth.auth().currentUser?.uid else {
                return
            }
            //Create model
            let newId = UUID().uuidString
            let newItem = ListOfTasksItem(id: newId,
                                          title: title,
                                          duDate: dueDate.timeIntervalSince1970,
                                          createdDate: Date().timeIntervalSince1970,
                                          isDone: false)
            
            //Save model
            
            let db=Firestore.firestore()
            
            db.collection("users")
                .document(uId)
                .collection("todos")
                .document(newId)
                .setData(newItem.asDictionary())
            
            
        }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces) .isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
}

//
//  ListOfTasksItemViewViewModel.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

//View model for a single to do list item view (each row in items list)


class ListOfTasksItemViewViewModel: ObservableObject {
    init() {
        
        
    }
    
    func toggleIsDone(item: ListOfTasksItem) {
        var itemCopy = item
        itemCopy.setDone(_state: !item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}

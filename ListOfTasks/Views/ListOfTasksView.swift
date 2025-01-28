//
//  ListOfTasksItemsView.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import FirebaseFirestore
import SwiftUI

struct ListOfTasksView: View {
    @StateObject var viewModel: ListOfTasksViewViewModel
    @FirestoreQuery var items: [ListOfTasksItem]
    
 
    init(userId: String) {
       
        //users/<id>/todos/
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ListOfTasksViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items) {item in
                    ListOfTasksItemView(item: item)
                        .swipeActions {
                            
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("List Of Tasks")
            .toolbar{
                Button(action: {
                    //Action
                    viewModel.showingNewItemView = true
                }
                       , label: {
                Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}



#Preview {
    ListOfTasksView(userId: "NXhsN7Q5qNOxIIQcFVoytbTOsfQ2")
}

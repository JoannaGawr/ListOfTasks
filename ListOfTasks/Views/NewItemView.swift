//
//  NewItemView.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel ()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                //Due date
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                LOTButton(title: "Save", background: .pink) {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false}
                        else {
                            viewModel.showAlert = true
                        }
                    }
                    
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please select due date that is not earlier than today."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true},
                                          set: {_ in}))
}

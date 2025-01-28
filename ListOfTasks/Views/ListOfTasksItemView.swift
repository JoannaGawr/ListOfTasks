//
//  ListOfTasksItemView.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import SwiftUI

struct ListOfTasksItemView: View {
    @StateObject var viewModel = ListOfTasksItemViewViewModel()
    let item: ListOfTasksItem
    var body: some View {
        HStack {
            VStack (alignment: .leading)
            {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.duDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
                
            }
        label: {
            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(Color.blue)
        }
        }
    }
}

#Preview {
    ListOfTasksItemView(item: .init(id: "123",
                                    title: "Buy milk",
                                    duDate: Date().timeIntervalSince1970,
                                    createdDate: Date().timeIntervalSince1970,
                                    isDone: true))
}

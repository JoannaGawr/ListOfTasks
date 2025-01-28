//
//  LOTButton.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-03.
//

import SwiftUI

struct LOTButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
       
        Button{
            action()
        }
    label: {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
            Text(title)
                .foregroundStyle(.white)
                .bold()
            }
        }
    }
}

#Preview {
    LOTButton(title: "Value", background: .pink) {
        //Action
    }
        
    
}

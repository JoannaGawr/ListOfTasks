//
//  test.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-12-28.
//

import SwiftUI

struct test: View {
    var body: some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                
            }
            HStack {
                Text("Email: ")
                    .bold()
               
            }
            HStack {
                Text("Member since: ")
                    .bold()
                
            
        }
        .padding()
        //Sign out
        
        Button("Log Out") {
            
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
    }


#Preview {
    test()
}

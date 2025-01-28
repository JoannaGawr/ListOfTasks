//
//  RegisterView.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()

    
    var body: some View {
        VStack {
            //Header
            
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       background: Color(red: 241/255, green: 180/255, blue: 161/255),
                       titleFont: .custom("Bungee-Regular", size: 40),
                    subtitleFont: .custom("Helvetica Neue", size: 25))
            
            Form{
                TextField ("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField ("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField ("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                LOTButton(
                    title: "Create Account",
                    background: Color(red: 241/255, green: 180/255, blue: 161/255))
                {
                    viewModel.register()
                 
                }
                
                .padding()
            }
            
            .offset(y: -50)
            
            Spacer()
            
        }
    }
}
    
#Preview {
    RegisterView()
}

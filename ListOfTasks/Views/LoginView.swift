//
//  LoginView.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-01.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel ()
    
    var body: some View {
        NavigationStack{
            VStack {
                //Header
                
                HeaderView(title: "MY TODOS",
                           subtitle: "Get things done",
                           angle: 15,
                           background: Color(red: 143/255, green: 195/255, blue: 225/255),
                           titleFont: .custom("Bungee-Regular", size: 40),
                        subtitleFont: .custom("Helvetica Neue", size: 25))
                
                
                //Login Form
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    LOTButton(
                        title: "Log In",
                        background: Color(red: 135/255, green: 206/255, blue: 235/255))
                    {
                        viewModel.login()
                    }
                              
                    .padding()
                              
                }
                
                .offset(y: 50)
                
                //Create Account
                
                VStack{
                    
                    Text("First time here?")
                    NavigationLink(destination: RegisterView()) {
                        Text("Create an account")
                            .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                            .padding()
                            
                           
                           
                    }
                    
                    
                }
        
                .padding(.bottom, 50)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}

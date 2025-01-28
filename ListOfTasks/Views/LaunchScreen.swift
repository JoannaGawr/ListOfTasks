//
//  LaunchScreen.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-11.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 1.0
    @State private var opacity = 0.5
    @State private var y0ffset: CGFloat = 0
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            GeometryReader { geometry in
                ZStack {
                    Color(red: 236/255, green: 246/255, blue: 251/255).edgesIgnoringSafeArea(.all)
                    
                    Image("IconLaunchScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .scaleEffect(size)
                        .opacity(opacity)
                       
                        .offset(y: y0ffset)
                    
                    Spacer()
                }
            }
            .onAppear {
                // First growth animation
                withAnimation(.easeInOut(duration: 2.5)) {
                    self.size = 1.2
                    self.opacity = 1.0
                }
                
                // Second growth animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        self.size = 1.0
                    }
                }
                
                // Delay the sliding and fading animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeOut(duration: 1.0)) {
                        self.y0ffset = -UIScreen.main.bounds.height / 2
                        self.opacity = 0 // Fade out to completely transparent
                    }
                }
                
                // Transition to main view
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}

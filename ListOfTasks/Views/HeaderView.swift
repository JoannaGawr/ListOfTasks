//
//  HeaderView.swift
//  ListOfTasks
//
//  Created by Joanna Gawryszewska on 2024-09-02.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    let titleFont: Font
    let subtitleFont: Font
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text (title)
                    .font(titleFont)  // Use the custom titleFont here
                    .foregroundColor(Color.white)
                Text (subtitle)
                    .foregroundColor(Color.white)
                    .font(subtitleFont)
                }
            .padding(.top, 80)
        }
        .frame(width:UIScreen.main.bounds.width * 3,
               height: 350)
        
        .offset(y:-150)

    }
}

#Preview {
                    HeaderView( title: "Title",
                                subtitle: "Subtitle",
                                angle: 15,
                                background: .blue,
                                titleFont: .custom("Bungee-Regular", size: 45),
                                subtitleFont: .custom("Helvetica Neue", size: 22))
}

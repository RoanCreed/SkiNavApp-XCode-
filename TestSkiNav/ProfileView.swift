//
//  ProfileView.swift
//  TestSkiNav
//
//  Created by Roan Creed on 21/02/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.top)
            VStack {
                Text("Profile View")

                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Tap")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    ProfileView()
}

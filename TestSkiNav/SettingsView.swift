//
//  SettingsView.swift
//  TestSkiNav
//
//  Created by Roan Creed on 21/02/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.top)
            VStack {
                Text("Settings View")

                
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
    SettingsView()
}

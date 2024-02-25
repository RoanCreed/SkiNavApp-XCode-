//
//  ContentView.swift
//  TestSkiNav
//
//  Created by Roan Creed on 21/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0 // Track the selected tab index
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Links to seperate views
            MapView()
                .tabItem {
                    Image(systemName: "skis")
                    Text("Ski Nav")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                    
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}



#Preview {
    ContentView()
}

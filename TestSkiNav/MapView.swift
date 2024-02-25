//
//  MapView.swift
//  TestSkiNav
//
//  Created by Roan Creed on 21/02/2024.
//

import SwiftUI

struct MapView: View {
    @State private var isShowingMapRouteView = false
    @State private var isShowingSelectedRunsSheet = false
    @State private var isShowingLocationSelectionSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.cyan.edgesIgnoringSafeArea(.top)
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // When button is tapped
                            self.isShowingLocationSelectionSheet = true
                        }) {
                            Text(Image(systemName: "mappin"))
                                .font(.system(size: 24))
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .foregroundColor(.black)
                                .cornerRadius(35)
                                .shadow(color: Color.black.opacity(0.5), radius: 1, x: 0, y: 0)
                        }
                        .padding(.bottom, 10)
                        .padding(.trailing, 25)
                        .sheet(isPresented: $isShowingLocationSelectionSheet, content: {
                            StartLocationSelectionSheet()
                                .presentationDetents([.medium, .large])
                        })
                        
                    }
                    
                    HStack {
                                                
                        Spacer()
                        Button(action: {
                            self.isShowingSelectedRunsSheet = true
                        }) {
                            Text(Image(systemName: "list.bullet"))
                                .font(.system(size: 26))
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .foregroundColor(.black)
                                .cornerRadius(35)
                                .shadow(color: Color.black.opacity(0.5), radius: 1, x: 0, y: 0)
                        }
                        .padding(.bottom, 10)
                        .padding(.trailing, 25)
                        .sheet(isPresented: $isShowingSelectedRunsSheet, content: {
                            SelectedRunsSheet()
                                .presentationDetents([.medium, .large])
                        })
                    }

                    HStack {
                        Spacer()
                        Button(action: {
                            self.isShowingMapRouteView = true
                        }) {
                            Text("GO")
                                .font(.system(size: 16.5))
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .foregroundColor(.black) // Set text colour
                                .cornerRadius(35)
                                .shadow(color: Color.black.opacity(0.5), radius: 1, x: 0, y: 0)
                                .fontWeight(.medium)
                        }
                        .padding(.bottom, 50)
                        .padding(.trailing, 25)
                    }
                                        
                }
                // Links to nav stack
                .navigationDestination(
                     isPresented: $isShowingMapRouteView) {
                         MapRouteView()
                     }
            }
            // This view nav bar title
            .navigationBarTitle("Map", displayMode: .large)
        }
    }
}

struct MapRouteView: View {
    @State private var isBookmarked = false
    
    let routeInformation = [
        "Route 1st step",
        "Route 2nd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step",
        "Route 3rd step"
    ]
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(routeInformation, id: \.self) { info in
                        HStack {
                            //Image(systemName: "arrow.right.circle")
                                //.foregroundColor(.blue)
                            Text(info)
                                .font(.system(size: 25))
                        }
                        .padding(.top, 8)
                    }
                }
                
            }
            //.background(Color(red: 0.949, green: 0.949, blue: 0.969))
        }
        .navigationBarTitle("Map route", displayMode: .large)
        .navigationBarItems(
            trailing:
                Button(action: {

                    isBookmarked.toggle()
                    
                    //Save the bookmark to profile page, with some run information (Total length,run order etc)
                }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                }
                .padding(.trailing, 20)
//                .alert(isPresented: $isBookmarked) {
//                    Alert(title: Text("Route bookmarked!"),
//                          message: Text("Success! You can view your saved routes from the profile tab."),
//                          dismissButton: .default(Text("OK")))
//                }
        )
    }
}

struct SelectedRunsSheet: View {
    var body: some View {
        ZStack {
            VStack {
                // Add a list of the selected runs here (access from class)
                Text("User Selected Runs Here")
            }
        }
        
    }
}


struct StartLocationSelectionSheet: View {
    // Import a list of start and end names for each run
    let run = ["Croissant Start", "Croissant End", "Lac Blanc Start", "Lac Blanc End", "Tete Ronde Start", "Tete Ronde End"]
    @State var selectedRun: String? = nil   // State is used when this is the owener of the data, and is the one passing it

    var body: some View {
        List {
            ForEach(run, id: \.self) { item in
                SelectionCell(run: item, selectedRun: self.$selectedRun)
            }
        }
    }
}

struct SelectionCell: View {

    let run: String
    @Binding var selectedRun: String?   // Binding is used when using data from other views

    var body: some View {
        HStack {
            Text(run)
            Spacer()
            if run == selectedRun {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }
        .onTapGesture {
            if (self.selectedRun == self.run) {
                selectedRun = ""
            } else {
                self.selectedRun = self.run
            }
                
        }
    }
    
}

#Preview {
    MapView()
}

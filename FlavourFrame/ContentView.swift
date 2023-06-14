//
//  ContentView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationSplitView {
            AddButton()
        } detail: {
            NavigationStack(path: $path) {
                FlavourList()
                    .navigationTitle("Past Flavours")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad (9th generation)")
            .environmentObject(FlavourStore())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

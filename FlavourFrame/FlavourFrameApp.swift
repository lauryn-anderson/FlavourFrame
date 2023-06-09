//
//  FlavourFrameApp.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

@main
struct FlavourFrameApp: App {    
    @StateObject private var flavourStore = FlavourStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flavourStore)
        }
    }
}

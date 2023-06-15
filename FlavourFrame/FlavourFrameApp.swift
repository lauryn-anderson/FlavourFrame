//
//  FlavourFrameApp.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

@main
struct FlavourFrameApp: App {    
    @StateObject private var store = FlavourStore()

    var body: some Scene {
        WindowGroup {
            ContentView(flavours: $store.flavours) {
                Task {
                    do {
                        try await store.save(flavours: store.flavours)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

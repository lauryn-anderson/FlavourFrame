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
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ContentView() {
                Task {
                    do {
                        try await store.save(flavours: store.flavours)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .environmentObject(store)
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "FlavourFrame will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.flavours = Flavour.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}

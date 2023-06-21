//
//  FlavourFrameApp.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

@main
struct FlavourFrameApp: App {
    @StateObject private var dataManager = DataManager()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ContentView() {
                Task {
                    do {
                        try await dataManager.save(store: dataManager.store)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .environmentObject(dataManager)
            .task {
                do {
                    try await dataManager.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "FlavourFrame will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                dataManager.store.flavours = Flavour.sampleData
                dataManager.store.frames = Frame.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}

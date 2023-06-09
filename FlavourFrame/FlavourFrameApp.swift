//
//  FlavourFrameApp.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI
import PencilKit

@main
struct FlavourFrameApp: App {
    @StateObject private var store = FlavourStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

class FlavourStore: ObservableObject {
    @Published var flavours: [Flavour]
    
    init(flavours: [Flavour] = []) {
        self.flavours = flavours
    }
}

struct Flavour: Codable, Identifiable {
    var id = UUID()
    var name = ""
    var drawing: PKDrawing?
}

var testFlavours = FlavourStore(flavours: flavourData)

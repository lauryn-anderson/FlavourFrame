//
//  FlavourStore.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import Foundation
import PencilKit
import SwiftUI


@MainActor
class DataStore: ObservableObject {
    @Published var flavours: [Flavour] = []
    @Published var frames: [Frame] = []
    
    // keep file for flavour data in user's Documents directory
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("store.json")
    }

    init() {
        self.flavours = []
        self.frames = []
    }

    init(flavours: [Flavour], frames: [Frame]) {
        self.flavours = flavours
        self.frames = frames
    }

    // load flavour data from file
    func load() async throws {
        let task = Task<Store, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let flavourArray = try JSONDecoder().decode([Flavour].self, from: data)
            return flavourArray
        }
        let flavours = try await task.value
        self.flavours = flavours
    }
    
    // save flavour data to file
    func save(flavours: [Flavour]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(flavours)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}


extension DataStore {
    func assignDrawing(_ drawing: PKDrawing, to flavour: Flavour) {
        guard let index = flavours.firstIndex(of: flavour) else { return }
        var flavour = flavours[index]
        flavour.assignDrawing(drawing)
        flavours[index] = flavour
    }
}

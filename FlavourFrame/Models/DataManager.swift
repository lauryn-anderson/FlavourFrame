//
//  DataManager.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//


import Foundation
import PencilKit
import SwiftUI


@MainActor
class DataManager: ObservableObject {
    
    @Published var store: DataStore
    
    // keep file for data in user's Documents directory
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("store.json")
    }

    init() {
        self.store = DataStore()
    }

    init(flavours: [Flavour], frames: [Frame]) {
        self.store = DataStore(flavours: flavours, frames: frames)
    }

    // load data from file
    func load() async throws {
        let task = Task<DataStore, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return DataStore()
            }
            let dataStore = try JSONDecoder().decode(DataStore.self, from: data)
            return dataStore
        }
        let store = try await task.value
        self.store = store
    }
    
    // save data to file
    func save(store: DataStore) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(store)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
